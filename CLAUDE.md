# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build the site (outputs to ./site directory)
bundle exec rake build

# Serve locally during development (builds first, then runs puma)
bundle exec rake serve

# Clean the build directory
bundle exec rake clean
```

## Architecture

This is a static site generator for mike.daless.io, built with a custom Rake-based pipeline.

**Build Pipeline:**
1. Templates (`.md`, `.haml`, `.rhtml`, `.erb`) are processed through Tilt and wrapped in `layout.rhtml`
2. Artifacts (`prez/`, `posts/`, `assets/`) are rsynced directly to the output directory
3. Redirects are generated from `config.yml`
4. TailwindCSS processes `site.css` last (depends on generated HTML)

**Key Files:**
- `config.yml` - Site configuration: navigation, file list, redirects, artifacts
- `site.rb` - Site class with template processing logic and front matter parsing
- `layout.rhtml` - Main HTML layout template
- `Rakefile` - Build rules using Tilt for template processing

**Template Processing:**
- Supports chained extensions (e.g., `.md.erb` processes ERB first, then Markdown)
- Front matter in YAML format between `---` delimiters
- Templates receive `site` and `page` variables; `page[:no_layout]` skips layout wrapping

**RSS Feed:**
- `feed.xml.erb` generates `site/feed.xml`, validated against `rss-2_0.xsd` during build
- `Site#rss_entries` in `site.rb` aggregates entries from two sources:
  - Blog posts: scanned from `posts/**/*.md` front matter
  - Media entries: read from `media.rhtml` front matter sections (`:video`, `:audio`, `:presentations`)
- Each entry needs `:title`, `:date`, `:url`, and optionally `:desc`/`:description`

**Output:**
- Built site goes to `./site/` (gitignored)
- GitHub Actions deploys to GitHub Pages on push to main
