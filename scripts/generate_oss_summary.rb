#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"

# Load classified data
data = JSON.parse(File.read("classified_work.json"))

# Topic display order and names
TOPIC_ORDER = [
  "Nokogiri",
  "sqlite3-ruby",
  "Loofah",
  "Rails",
  "tailwindcss-rails",
  "tailwindcss-ruby",
  "rake-compiler-dock",
  "ruby-c-extensions-explained",
  "mini_portile",
  "activerecord-tenanted",
  "http-cookie",
  "rails-html-sanitizer",
  "rails-dom-testing",
  "trix",
  "OSS",
  "Ruby",
  "Rubygems",
  "Rubygems.org On Call",
  "OSS/Projects/TruffleRuby",
  "OSS/Projects/Herb",
]

TOPIC_DISPLAY_NAMES = {
  "OSS" => "Other OSS Contributions",
  "OSS/Projects/TruffleRuby" => "TruffleRuby",
  "OSS/Projects/Herb" => "Herb",
  "Rubygems.org On Call" => "Rubygems.org",
}

TOPIC_URLS = {
  "Nokogiri" => "https://github.com/sparklemotion/nokogiri",
  "sqlite3-ruby" => "https://github.com/sparklemotion/sqlite3-ruby",
  "Loofah" => "https://github.com/flavorjones/loofah",
  "Rails" => "https://github.com/rails/rails",
  "tailwindcss-rails" => "https://github.com/rails/tailwindcss-rails",
  "tailwindcss-ruby" => "https://github.com/flavorjones/tailwindcss-ruby",
  "rake-compiler-dock" => "https://github.com/rake-compiler/rake-compiler-dock",
  "ruby-c-extensions-explained" => "https://github.com/flavorjones/ruby-c-extensions-explained",
  "mini_portile" => "https://github.com/flavorjones/mini_portile",
  "activerecord-tenanted" => "https://github.com/basecamp/activerecord-tenanted",
  "http-cookie" => "https://github.com/sparklemotion/http-cookie",
  "rails-html-sanitizer" => "https://github.com/rails/rails-html-sanitizer",
  "rails-dom-testing" => "https://github.com/rails/rails-dom-testing",
  "trix" => "https://github.com/basecamp/trix",
  "Rubygems" => "https://github.com/rubygems/rubygems",
  "Rubygems.org On Call" => "https://rubygems.org",
}

def format_action(action)
  # Clean up the action text for display
  text = action.dup

  # Remove Obsidian-style wikilinks like [[text]]
  text.gsub!(/\[\[([^\]|]+)\|?[^\]]*\]\]/, '\1')

  # Clean up leading verbs for brevity in some cases
  # But keep the markdown links intact

  text.strip
end

# Generate markdown
output = []

output << "---"
output << "title: Open Source Update / 2025 Summary"
output << "short: |"
output << "  A summary of my open source work from April through December 2025."
output << "---"
output << ""
output << "# Open Source Update / 2025 Summary"
output << ""
output << "2025-01-03"
output << "{: .text-sm .italic .opacity-75 }"
output << ""
output << "Hello!"
output << ""
output << "This post summarizes my open source work from April through December 2025. See previous updates for [March](/posts/2025/03/open-source-update.html) and [April](/posts/2025/04/open-source-update.html)."
output << ""

# Process topics in order
TOPIC_ORDER.each do |topic|
  next unless data[topic]

  topic_data = data[topic]
  releases = topic_data["releases"]
  contributions = topic_data["contributions"]
  reviews = topic_data["reviews"]

  # Skip if nothing to show
  next if releases.empty? && contributions.empty? && reviews.empty?

  display_name = TOPIC_DISPLAY_NAMES[topic] || topic
  url = TOPIC_URLS[topic]

  if url
    output << "## [#{display_name}](#{url})"
  else
    output << "## #{display_name}"
  end
  output << ""

  unless releases.empty?
    output << "### Releases"
    output << ""
    releases.each do |item|
      output << "- #{format_action(item["action"])}"
    end
    output << ""
  end

  unless contributions.empty?
    output << "### Contributions"
    output << ""
    contributions.each do |item|
      output << "- #{format_action(item["action"])}"
    end
    output << ""
  end

  unless reviews.empty?
    output << "### Reviews and user help"
    output << ""
    reviews.each do |item|
      output << "- #{format_action(item["action"])}"
    end
    output << ""
  end
end

output << ""
output << "Thank you for reading and thank you for your support!"
output << ""
output << "❤️❤️❤️,<br>"
output << "-mike"

puts output.join("\n")
