#!/usr/bin/env ruby
# Extract "What did you do today?" sections from journal entries
# for the date range 2025-04-06 through 2025-12-31

require 'json'
require 'date'

JOURNAL_DIR = "/home/flavorjones/Documents/Obsidian/flavorjones/Journal"
START_DATE = Date.new(2025, 4, 6)
END_DATE = Date.new(2025, 12, 31)

START_MARKER = "## What did you do today?"
END_MARKER = "## What did you learn or think about today?"

def extract_section(file_path)
  content = File.read(file_path)

  start_idx = content.index(START_MARKER)
  return nil unless start_idx

  end_idx = content.index(END_MARKER, start_idx)

  # If END_MARKER not found, take everything after START_MARKER
  if end_idx
    section = content[(start_idx + START_MARKER.length)...end_idx].strip
  else
    section = content[(start_idx + START_MARKER.length)..].strip
  end

  section.empty? ? nil : section
end

results = []

(START_DATE..END_DATE).each do |date|
  file_name = "#{date.strftime('%Y-%m-%d')}.md"
  file_path = File.join(JOURNAL_DIR, file_name)

  next unless File.exist?(file_path)

  section = extract_section(file_path)
  next unless section

  results << {
    date: date.to_s,
    content: section
  }
end

puts JSON.pretty_generate(results)
