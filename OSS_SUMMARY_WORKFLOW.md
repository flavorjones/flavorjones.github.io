# OSS Summary Workflow

Instructions for generating monthly/quarterly open-source work summaries from journal entries.

## Overview

This workflow extracts open-source work items from Obsidian journal entries, classifies them into categories, and generates a blog post summarizing the work.

## Pipeline

```
Journal files → extract_journal.rb → journal_consolidated.json
                                            ↓
                              parse_oss_work_items.rb
                                            ↓
                                   oss_work_items.json
                                            ↓
                                classify_oss_work.rb
                                            ↓
                                  classified_work.json
                                            ↓
                               generate_oss_summary.rb
                                            ↓
                        posts/YYYY/MM/open-source-update.md
```

## Step 1: Extract Journal Entries

Edit `scripts/extract_journal.rb` to set the date range:

```ruby
START_DATE = Date.new(2025, 5, 1)   # Adjust start date
END_DATE = Date.new(2025, 5, 31)    # Adjust end date
```

Then run:

```bash
ruby scripts/extract_journal.rb > journal_consolidated.json
```

This extracts content between `## What did you do today?` and `## What did you learn or think about today?` from each journal file.

## Step 2: Parse into Topics and Actions

```bash
ruby scripts/parse_oss_work_items.rb > oss_work_items.json
```

This parses the raw journal content into structured data:
- Recognizes topic headers (e.g., `[[Nokogiri]]` or plain text headings)
- Extracts bullet-point actions under each topic
- Concatenates sub-bullets into parent items with ` / ` separator

Output format:
```json
[
  {
    "topic": "Nokogiri",
    "actions": [
      { "date": "2025-05-15", "action": "Fixed bug in parser / Added tests" }
    ]
  }
]
```

## Step 3: Classify Work Items

```bash
ruby scripts/classify_oss_work.rb > classified_work.json
```

### Classification Rules

**Releases** (check first - most specific):
- Contains "Released" or "Release v"
- URL contains `/releases/`

**Reviews and User Help** (supporting others):
- "Reviewed" (when PR author is NOT flavorjones)
- "User help", "Responded to", "Replied on", "Answered", "Helped"
- "Commented and closed"

**Contributions** (work by flavorjones):
- Verbs: Wrote, Created, Fixed, Opened, Investigated, Worked on, Drafted, Bumped, Updated, Started, Merged, Presented
- PRs with "by flavorjones" in URL
- Upstream bug reports filed
- Security advisories written

**Exclusions** (filtered out):
- Administrative: "booked flights", "resigned", "signed the docs"
- Vague: "lots of cleanup", "working on the talk"
- Pure meetings: "meeting!", "chatted with X"
- Personal workflow items

### Excluded Topics

Edit `EXCLUDED_TOPICS` in `scripts/classify_oss_work.rb` to skip non-OSS topics:
- Internal work projects
- Conference logistics
- Organizational matters

## Step 4: Generate Markdown

Edit `scripts/generate_oss_summary.rb`:
- Update `TOPIC_ORDER` for display order
- Update `TOPIC_DISPLAY_NAMES` for custom names
- Update `TOPIC_URLS` for project links

Then run:

```bash
mkdir -p posts/YYYY/MM
ruby scripts/generate_oss_summary.rb > posts/YYYY/MM/open-source-update.md
```

## Step 5: Post-Processing

After generating, manually review and edit:

### Change verbs to past tense

Common replacements:
- "Investigating" → "Investigated"
- "Working on" → "Worked on"
- "Reviewing" → "Reviewed"
- "Helping" → "Helped"
- "Looking into" → "Looked into"
- "Trying to" → "Tried to"
- "Getting" → "Got"
- "Finishing up" → "Finished"
- "Continuing" → "Continued"

### Other cleanup
- Remove duplicates (same item may appear on multiple days)
- Write an appropriate intro paragraph
- Remove any Obsidian wiki-link artifacts `[[...]]`
- Check for broken markdown links

### Update site configuration

1. Add to `config.yml` under `files:`:
   ```yaml
   - posts/YYYY/MM/open-source-update.html
   ```

2. Add to `posts.haml` at the top:
   ```haml
   %h2
     %a{href: "posts/YYYY/MM/open-source-update.html"}
       Open Source Update / Month 'YY

   %p
     Description here.
     %span{class: "italic text-sm"} (YYYY-MM-DD)
   ```

## File Locations

| File | Purpose |
|------|---------|
| `/home/flavorjones/Documents/Obsidian/flavorjones/Journal/` | Source journal files |
| `scripts/extract_journal.rb` | Extracts raw journal sections |
| `journal_consolidated.json` | Raw extracted content |
| `scripts/parse_oss_work_items.rb` | Parses into topics/actions |
| `oss_work_items.json` | Structured work items |
| `scripts/classify_oss_work.rb` | Classifies into categories |
| `classified_work.json` | Classified output |
| `scripts/generate_oss_summary.rb` | Generates markdown |
| `posts/YYYY/MM/open-source-update.md` | Final blog post |
| `config.yml` | Site file list |
| `posts.haml` | Writing page |

## Topics to Include

Core projects maintained by flavorjones:
- Nokogiri, sqlite3-ruby, Loofah
- tailwindcss-ruby, mini_portile, http-cookie
- ruby-c-extensions-explained

Rails ecosystem:
- Rails, tailwindcss-rails
- rails-html-sanitizer, rails-dom-testing, trix

Community/ecosystem:
- rake-compiler-dock
- Ruby, Rubygems, Rubygems.org
- activerecord-tenanted

## Quick Reference

```bash
# Full pipeline
vim scripts/extract_journal.rb              # Edit date range
ruby scripts/extract_journal.rb > journal_consolidated.json
ruby scripts/parse_oss_work_items.rb > oss_work_items.json
ruby scripts/classify_oss_work.rb > classified_work.json
mkdir -p posts/2025/06
ruby scripts/generate_oss_summary.rb > posts/2025/06/open-source-update.md

# Preview
bundle exec rake serve
```
