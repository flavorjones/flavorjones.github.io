#!/usr/bin/env ruby
# Parse journal entries to extract topics and their actions
# Output: JSON with topics and their associated actions
# Sub-bullet items are concatenated into their parent bullet item

require 'json'

input = JSON.parse(File.read('journal_consolidated.json'))

# Structure: { topic_name => [{ date:, action: }, ...] }
topics = Hash.new { |h, k| h[k] = [] }

input.each do |entry|
  date = entry['date']
  content = entry['content']

  current_topic = nil
  current_action = nil

  content.each_line do |line|
    line = line.rstrip

    # Match topic headers: [[Topic Name]] or [[Topic Name|Display Name]] or plain "Topic Name"
    # Also handles [[Topic#anchor]] format
    if line =~ /^\[\[([^\]|#]+)/
      # Save pending action before switching topics
      if current_topic && current_action
        topics[current_topic] << { date: date, action: current_action }
        current_action = nil
      end
      current_topic = $1.strip
    elsif line =~ /^([A-Za-z][A-Za-z0-9\s\-\/]+)$/ && !line.start_with?('-') && line.strip.length > 1
      # Plain text topic (capitalized, no leading dash)
      candidate = line.strip
      # Only treat as topic if it's short-ish and looks like a heading
      if candidate.length < 50 && !candidate.include?('[') && !candidate.start_with?('http')
        # Save pending action before switching topics
        if current_topic && current_action
          topics[current_topic] << { date: date, action: current_action }
          current_action = nil
        end
        current_topic = candidate
      end
    elsif line =~ /^-\s+(.+)/ && current_topic
      # New top-level action item - save previous action first
      if current_action
        topics[current_topic] << { date: date, action: current_action }
      end
      current_action = $1.strip
    elsif line =~ /^\s+-\s+(.+)/ && current_topic && current_action
      # Sub-action (indented) - concatenate to current action
      sub_action = $1.strip
      current_action += " / " + sub_action
    end
  end

  # Save final pending action for this entry
  if current_topic && current_action
    topics[current_topic] << { date: date, action: current_action }
  end
end

# Sort topics alphabetically, sort actions by date within each topic
sorted_topics = topics.keys.sort.map do |topic|
  actions = topics[topic].sort_by { |a| a[:date] }
  { topic: topic, actions: actions }
end

puts JSON.pretty_generate(sorted_topics)
