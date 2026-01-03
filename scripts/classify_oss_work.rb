#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"

# Load the work items
work_items = JSON.parse(File.read("oss_work_items.json"))

# Exclusion patterns
EXCLUSION_PATTERNS = [
  /\bmeeting!?\b/i,
  /\bchat(ted)? with\b/i,
  /\bmet with\b/i,
  /\bbooked flights\b/i,
  /\bresigned\b/i,
  /\bsigned the docs\b/i,
  /\bsigned up for\b/i,
  /\bset up a separate browser\b/i,
  /\bgot my acceptance email\b/i,
  /\bfilled out.*form\b/i,
  /\breserved ticket\b/i,
  /\bworking on the talk\b/i,
  /\bworking on the gem\b/i,
  /\blots of cleanup\b/i,
  /\bprepared for the worst\b/i,
  /\bwatching the outcomes\b/i,
  /\baudited permissions\b/i,
  /\btexts with\b/i,
  /\bSet a budget limit\b/i,
  /\bUpdated my personal cache\b/i,
  /\btrying to get a good benchmark and failing\b/i,
  /\bbanged my head against the wall\b/i,
  /\bStill trying to get this shit to build\b/i,
  /\bRails at Scale summit\b/i,
]

# Topics to exclude entirely
EXCLUDED_TOPICS = [
  "37signals",
  "2025-09 Faster AR Allocations",
  "Rails World 2025",
  "Rails Conf 2025",
  "Ruby Central OSS Committee",
  "Ruby Central",
  "Precompiled gems",
  "Native precompilation",
]

def classify(action_text)
  # Release detection - check first as it's most specific
  if action_text =~ /\bReleased\b/i || action_text =~ /\/releases\//
    return :release
  end

  # Exclusion detection
  EXCLUSION_PATTERNS.each do |pattern|
    return :exclude if action_text =~ pattern
  end

  # Review/user help detection (others' work)
  if action_text =~ /\bUser help\b/i ||
     action_text =~ /\bResponded to\b/i ||
     action_text =~ /\bReplied on\b/i ||
     action_text =~ /\bAnswered\b/i ||
     action_text =~ /\bHelped\b/i ||
     action_text =~ /\bHelping\b/i ||
     action_text =~ /\bCommented and closed\b/i ||
     action_text =~ /\bAnswering questions\b/i
    return :review
  end

  # "Reviewed" needs special handling - check if it's reviewing someone else's work
  if action_text =~ /\bReviewed\b/i
    # If it mentions "by flavorjones" it's own work being reviewed/merged
    unless action_text =~ /by flavorjones/
      return :review
    end
  end

  # Contribution detection
  if action_text =~ /\bWrote\b/i ||
     action_text =~ /\bCreated\b/i ||
     action_text =~ /\bFixed\b/i ||
     action_text =~ /\bOpened\b/i ||
     action_text =~ /\bInvestigat/i ||
     action_text =~ /\bWorking on\b/i ||
     action_text =~ /\bWorked on\b/i ||
     action_text =~ /\bDrafted\b/i ||
     action_text =~ /\bBumped\b/i ||
     action_text =~ /\bUpdated\b/i ||
     action_text =~ /\bStarted\b/i ||
     action_text =~ /\bMerged\b/i ||
     action_text =~ /\bPresented\b/i ||
     action_text =~ /\bFiled bug report\b/i ||
     action_text =~ /\bFinishing up\b/i ||
     action_text =~ /\bRebased\b/i ||
     action_text =~ /\bPicked back up\b/i ||
     action_text =~ /\bTightened up\b/i ||
     action_text =~ /\bConfigured\b/i ||
     action_text =~ /\bmigrated\b/i ||
     action_text =~ /by flavorjones/
    return :contribution
  end

  # Default to contribution for anything that looks like work
  :contribution
end

# Process and classify
classified = {}

work_items.each do |topic_data|
  topic = topic_data["topic"]
  actions = topic_data["actions"]

  # Skip excluded topics
  next if EXCLUDED_TOPICS.include?(topic)
  # Skip empty topics
  next if actions.nil? || actions.empty?

  classified[topic] = {
    releases: [],
    contributions: [],
    reviews: [],
    excluded: []
  }

  actions.each do |action_data|
    action = action_data["action"]
    date = action_data["date"]
    category = classify(action)

    item = { date: date, action: action }

    case category
    when :release
      classified[topic][:releases] << item
    when :contribution
      classified[topic][:contributions] << item
    when :review
      classified[topic][:reviews] << item
    when :exclude
      classified[topic][:excluded] << item
    end
  end

  # Remove topics with no classified items
  total = classified[topic][:releases].size +
          classified[topic][:contributions].size +
          classified[topic][:reviews].size
  classified.delete(topic) if total == 0
end

# Output as JSON for review
puts JSON.pretty_generate(classified)
