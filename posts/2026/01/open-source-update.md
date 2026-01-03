---
title: Open Source Update / 2025 Summary
short: |
  A summary of my open source work from April through December 2025.
---

# Open Source Update / 2025 Summary

2026-01-03
{: .text-sm .italic .opacity-75 }

ZOMG! I can't believe the year is over already. Happy new year!

I started the year off wanting to write up these summaries monthly, but apparently I'm easily distracted. Thankfully, I take good notes in my daily Obsidian journal, and so I was able to crank out a summary of everything I've done since the last update (with some help from Claude! ❤️).

So here we are: this post summarizes my open source work from April through December 2025. See previous updates for [March](/posts/2025/03/open-source-update.html) and [April](/posts/2025/04/open-source-update.html) if you're curious!

## [Nokogiri](https://github.com/sparklemotion/nokogiri)

### Releases

- [Release v1.18.8 / 2025-04-21 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.8)
  - Which shipped an upstream libxml2 security release: [v2.13.8 · GNOME / libxml2 · GitLab](https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.8)
  - And wrote the accompanying GHSA [Nokogiri updates packaged libxml2 to v2.13.8 to resolve CVE-2025-32414 and CVE-2025-32415 · Advisory · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-5w6v-399v-w3cc) /
- [Release v1.18.9 / 2025-07-20 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.9)
  - That release contains some [backported upstream libxml2 patches](https://github.com/sparklemotion/nokogiri/pull/3526) to address multiple vulnerabilities.
  - And wrote the accompanying GHSA [Nokogiri patches vendored libxml2 to resolve multiple CVEs · Advisory · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-353f-x4gh-cqq8)
- [Release v1.18.10 / 2025-09-15 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.10) with updates to libxml2 and libiconv.
- [Release v1.19.0 / 2025-12-28 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.19.0) with Ruby 4.0 native gem support!


### Contributions

- Spent few hours assessing 10-year-old libxml2 vulnerabilities for Tidelift 🙄
- Migrated the Maven Central namespace we use for publishing the JRuby implementation's dependencies
- Investigated [[bug] XSLT empty-string `document('')` should refer to the stylesheet, not `ENOENT` · Issue #3517 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3517). Bisected to libxslt v1.1.42 and opened and issue upstream: [regression: XSLT `document('')` should resolve to stylesheet root node (#145) · Issue · GNOME/libxslt](https://gitlab.gnome.org/GNOME/libxslt/-/issues/145)
- Investigated [(windows) Compilation of libiconv fails on windows with Ruby 3.4 · Issue #3519 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3519). Fixed with [dep: update vendored libiconv to 1.18 by flavorjones · Pull Request #3520 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3520)
- Looked into [[BUG] A heap-buffer-overflow in `hashmap_set_with_hash` at `gumbo-parser/src/hashmap.c:286:5` · Issue #3500 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3500) and [[BUG] A heap-buffer-overflow in `hashmap_get_with_hash` at `gumbo-parser/src/hashmap.c:337:34` · Issue #3508 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3508).
  - Fixed in [gumbo: Make sure to use the char* pointer as the hashmap item by flavorjones · Pull Request #3524 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3524).
  - Emailed VulDB (the CNA for the CVEs filed) and requested that they be rejected: [Requesting a rejection of CVE-2025-6490 and CVE-2025-6494 - mike.dalessio@gmail.com - Gmail](https://mail.google.com/mail/u/0/#sent/QgrcJHsBqznGTzBnMhhGGNPMSthnMtkJqnv).
  - Noted that the CVE is disputed in [[GHSA-jc9r-qcgw-fxq9] A vulnerability was found in sparklemotion nokogiri up to... by flavorjones · Pull Request #5778 · github/advisory-database](https://github.com/github/advisory-database/pull/5778) and [[GHSA-pf9w-gvcf-gv7m] A vulnerability was found in sparklemotion nokogiri up to... by flavorjones · Pull Request #5779 · github/advisory-database](https://github.com/github/advisory-database/pull/5779).
- Updated main to [dep: update packaged libxml2 to v2.14.4 by flavorjones · Pull Request #3499 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3499).
- Created and merged [dep: updated packaged libxml2 to v2.14.5 by flavorjones · Pull Request #3527 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3527)
- Worked on [Get CI green again (August 2025 edition) by flavorjones · Pull Request #3542 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3542)
- Merged [Fix SIGINT during parsing crashing Ruby by stevecheckoway · Pull Request #3535 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3535)
- Fixed [Don't use -std=c89 in compile-against-libxml2-source · Issue #3540 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3540)
- [[v1.18.x] backport libiconv upgrade to v1.18 by flavorjones · Pull Request #3550 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3550)
- [dep: update vendored libxml2 to v2.14.6 by flavorjones · Pull Request #3552 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3552)
- [ci: stop testing Ruby 3.1 windows source builds by flavorjones · Pull Request #3553 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3553)
- [dep: bump vendored libxml2 to v2.13.9 by flavorjones · Pull Request #3555 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3555)
- Investigated [[bug] RuntimeError: Error pulling: -1 · Issue #3558 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3558). Changed [Fix reader error handling by flavorjones · Pull Request #3561 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3561)
- Started [Release planning: v1.19.0 · Issue #3564 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3564)
- Opened [Why do libxslt 1.1.44 and 1.1.45 require libxml2 >= 2.15.1 (#163) · Issue · GNOME/libxslt](https://gitlab.gnome.org/GNOME/libxslt/-/issues/163) because the new maintainers are not being transparent about some of these decisions, and I think that's bullshit.
- Started working on the libxml2 2.15 upgrade, which has some challenging behavior changes.
- Investigated [[bug] Performance degradation parsing with xpath on JRuby · Issue #3581 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3581)
- Investigated [[bug] XML drops supported entities after an unsupported entity (e.g., `&nbsp;`) · Issue #3582 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3582)
- Worked on [Explore replacements for Xalan-J · Issue #1829 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/1829)
- [dep: Add native Ruby 4 support, drop Ruby 3.1 support by flavorjones · Pull Request #3592 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3592)
- Worked on and merged [dep: Add native Ruby 4 support, drop Ruby 3.1 support (v1.19.x) by flavorjones · Pull Request #3592 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3592). And ported to main: [dep: Add native Ruby 4 support, drop Ruby 3.1 support (main) by flavorjones · Pull Request #3595 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3595)
- Started working on converting nokogiri.org to Zensical!

### Reviews and user help

- Reviewed docs PRS from Burdette Lamar:
  - [New doc about parsing XML by BurdetteLamar · Pull Request #3501 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3501)
  - [Doc for XML::Node#prepend_child by BurdetteLamar · Pull Request #3507 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3507)
- User help at [[install] 2 retrie(s) left for libiconv-1.17.tar.gz (Net::OpenTimeout) · Issue #3521 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3521)
- responded to [HTML5 is unable to parse a fragment with table contents tags · Issue #3536 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3536), and opened [Explore using `template` as the default context node · Issue #3546 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3546)
- Helped zzak by looking into Rails CI failures related to libxml2: [wip: investigate CI failures by flavorjones · Pull Request #55596 · rails/rails](https://github.com/rails/rails/pull/55596)
- Reviewed and merged [Fix serial warnings by yokolet · Pull Request #3562 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3562)
- Reviewed and merged [Build zlib sequentially with `make -j1` to avoid race conditions on Windows by Watson1978 · Pull Request #3566 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3566)
- Commented and closed [[install] 1.8.10 cannot find nokogiri_gumbo.h termux · Issue #3576 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3576)
- Commented and closed [[bug] cannot install on ruby 4.0.0.preview2 on x86_64-linux-gnu · Issue #3577 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3577)

## [sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby)

### Releases

- [Release 2.7.0 / 2025-06-09 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.7.0) updating to sqlite v3.50.1.
- [Release 2.7.1 / 2025-06-30 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.7.1) updating to sqlite v3.50.2.
- [Release 2.7.2 / 2025-07-05 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.7.2) bugfix release.
- [Release 2.7.3 / 2025-07-18 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.7.3) updating to sqlite v3.50.3.
- [Release 2.7.4 / 2025-09-19 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.7.4) updating to sqlite v3.50.4.
- [Release 2.8.0 / 2025-11-05 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.8.0) updating to sqlite v3.51.0.
- [Release 2.8.1 / 2025-11-29 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.8.1) updating to sqlite v3.51.1.
- [Release 2.9.0 / 2025-12-27 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.9.0) with Ruby 4 native gem support and some small features.

### Contributions

- Investigated [gem install sqlite3 --platform=ruby fails to build starting at 2.6.0 · Issue #634 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/634). Reported upstream at [SQLite User Forum: The ”autoconf” tarball pkgconf flags are insufficient to link on RHEL platforms](https://sqlite.org/forum/forumpost/44a58c807353162f). Applied upstream fix as a patch in [Ensure we can resolve dlopen et al by flavorjones · Pull Request #635 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/635)
- Picked back up on the work to use the amalgamation: [dep: Vendor the SQLite amalgamation instead of the autoconf tarball by flavorjones · Pull Request #636 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/636)
- Tightened up [Ensure we can resolve dlopen et al by flavorjones · Pull Request #635 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/635) by changing it to a patch of the upstream fix.
- Bumped rdoc to v7 and republished the site with the new theme: https://sparklemotion.github.io/sqlite3-ruby/

### Reviews and user help

- Collaborated with captn3m0 on a feature to improve statement variable binding: [Expose statement bind parameters · Issue #627 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/627) and [Implements stmt.named_params by captn3m0 · Pull Request #642 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/642).
- Reviewed and merged [Fix typos by ankane · Pull Request #631 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/631)
- Replied on [Attempting to build packaged libsqlite unexpectedly links against system libraries · Issue #639 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/639)
- Reviewed [feat: aarch64-mingw-ucrt support by YOU54F · Pull Request #650 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/650)
- Reviewed [Allow calling each, each_hash without block by kch · Pull Request #656 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/656#pullrequestreview-3520753056)
- User help at [Fail to build with Ruby 4.0.0_preview2 · Issue #663 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/663#issuecomment-3693436466)

## [Loofah](https://github.com/flavorjones/loofah)

### Releases

- Released [Release 2.24.1 / 2025-05-12 · flavorjones/loofah](https://github.com/flavorjones/loofah/releases/tag/v2.24.1)
- Released [Release 2.25.0 / 2025-12-15 · flavorjones/loofah](https://github.com/flavorjones/loofah/releases/tag/v2.25.0)

### Contributions

- Wrote [Extract Loofah::HTML5::Scrub.allowed_uri? by flavorjones · Pull Request #300 · flavorjones/loofah](https://github.com/flavorjones/loofah/pull/300)
- Investigated [bypass JavaScript filtering in the link href. · Issue #299 · flavorjones/loofah](https://github.com/flavorjones/loofah/issues/299). Not sure if there's anything there, but I did tighten up related behavior in [Scrub.allowed_uri? better handles entities and control characters by flavorjones · Pull Request #301 · flavorjones/loofah](https://github.com/flavorjones/loofah/pull/301)

### Reviews and user help

- Reviewed and merged [Only load what is required from `cgi` by Earlopain · Pull Request #296 · flavorjones/loofah](https://github.com/flavorjones/loofah/pull/296) for Ruby 3.5 support

## [Rails](https://github.com/rails/rails)

### Contributions

### Security

- Attended monthly meetings of the Rails security triage team, and worked on a few issues related to sanitization.

#### Merged!

- [Add a load hook `active_record_database_configurations` for `ActiveRecord::DatabaseConfigurations` by flavorjones · Pull Request #54959 · rails/rails](https://github.com/rails/rails/pull/54959)
- [Sort schema cache columns and indexes per table when dumping by flavorjones · Pull Request #54960 · rails/rails](https://github.com/rails/rails/pull/54960)
- [Drop vendored Trix files in favor of the `action_text-trix` gem by flavorjones · Pull Request #55058 · rails/rails](https://github.com/rails/rails/pull/55058)
- [Fix `SCRIPT_NAME` handling in URL helpers for root-mounted engines by flavorjones · Pull Request #55668 · rails/rails](https://github.com/rails/rails/pull/55668) and investigated the side effect described in [Engine route helpers fail in integration tests when mounted to root path after SCRIPT_NAME handling change in 8.0.3 · Issue #55756 · rails/rails](https://github.com/rails/rails/issues/55756)
- [Improve support for SQLite database URIs by flavorjones · Pull Request #55896 · rails/rails](https://github.com/rails/rails/pull/55896)
- [Shard swap prohibition error does not change `connected_to` stack by flavorjones · Pull Request #55925 · rails/rails](https://github.com/rails/rails/pull/55925)
- [Update shard swap prohibition to be more granular by flavorjones · Pull Request #55927 · rails/rails](https://github.com/rails/rails/pull/55927)
- [Active Record: Raise specific exception when a prohibited shard change is attempted. by flavorjones · Pull Request #55933 · rails/rails](https://github.com/rails/rails/pull/55933).

#### Not accepted

- Wrote [Introduce `config.active_record.strict_safe_http_methods` by flavorjones · Pull Request #54891 · rails/rails](https://github.com/rails/rails/pull/54891) which was not accepted, for good reasons. I expect this will come back at some point, because it's a necessary feature for apps to use sqlite read replicas.

#### Still baking

- Drafted a new feature to Introduce a `ReplicationCoordinator` class to support multiple AZs. Eventually I think this will become a feature in Rails, again to help support sqlite read replicas.

### Reviews and user help

- Reviewed of [Extend `ActionMailer::TestCase` with multi-part assertions by seanpdoyle · Pull Request #55348 · rails/rails](https://github.com/rails/rails/pull/55348)
- Reviewed [feat: add Intercom widget to rails world 2025 pages by ibramsterdam · Pull Request #501 · rails/website](https://github.com/rails/website/pull/501) and suggested some performance improvements.
- Reviewed [Moved LD_PRELOAD variable initialization to the Dockerfile from the entrypoint by igor-alexandrov · Pull Request #55252 · rails/rails](https://github.com/rails/rails/pull/55252)
- Responded on [Cloudflare R2 specific ActiveStorage service - rubyonrails-core - Ruby on Rails Discussions](https://discuss.rubyonrails.org/t/cloudflare-r2-specific-activestorage-service/89428/2)
- Reviewed [Forward `fill_in_rich_text_area` options to Capybara by seanpdoyle · Pull Request #53686 · rails/rails](https://github.com/rails/rails/pull/53686) 👍
- Reviewed [Raise explicit error on null byte in SQLite string quoting by himanshukale36 · Pull Request #55375 · rails/rails](https://github.com/rails/rails/pull/55375) 👎
- Reviewed [Prevent stack overflow in ActionText PlaintextConversion by intrip · Pull Request #55025 · rails/rails](https://github.com/rails/rails/pull/55025)
- Reviewed [Extend `ActionMailer::TestCase` with multi-part assertions by seanpdoyle · Pull Request #55348 · rails/rails](https://github.com/rails/rails/pull/55348)
- Reviewed [Treat `as: :html` tests request params as `:url_encoded_form` by seanpdoyle · Pull Request #50390 · rails/rails](https://github.com/rails/rails/pull/50390)
- Reviewed [Action Text: change tag helpers to accept optional blocks by seanpdoyle · Pull Request #55827 · rails/rails](https://github.com/rails/rails/pull/55827)
- Helped Rafael França diagnose a build issue in Ruby 3.0 with precompiled gems.

## [tailwindcss-rails](https://github.com/rails/tailwindcss-rails)

### Releases

- [Release v3.3.2 / 2025-04-21 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v3.3.2)
- Released [Release v4.2.3 / 2025-05-02 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.2.3)
- Released [Release v4.3.0.rc1 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.3.0.rc1)
- Released [Release v4.3.0.rc2 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.3.0.rc2)
- Released [Release v4.3.0 / 2025-07-06 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.3.0)
- Released [Release v4.4.0 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.4.0)

### Contributions

- Tried to answer questions raised at [Caching tailwind build assets in CI · rails/tailwindcss-rails · Discussion #543](https://github.com/rails/tailwindcss-rails/discussions/543)
- More babysitting of the multiple issues where people are struggling to reproduce a Rosetta-related bug in the upstream tailwind CLI on MacOS:
  - [Styles not loading properly. · Issue #534 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/534)
  - [Styles aren't generated when building a Docker image for ARM64 on a 2019 Intel MacBook Pro · Issue #17728 · tailwindlabs/tailwindcss](https://github.com/tailwindlabs/tailwindcss/issues/17728)
  - [v4 not building in x86_64 container built on arm64 mac · rails/tailwindcss-rails · Discussion #499](https://github.com/rails/tailwindcss-rails/discussions/499)
- Investigated [The system test scaffold generator is failing when a rails project lacks system tests · Issue #559 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/559). Fixed with [Gracefully handle --skip-system-test by flavorjones · Pull Request #562 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/562).
- Worked on [ci: Get green (August 2025 edition) by flavorjones · Pull Request #570 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/570)
- Investigated [System test scaffolding failing · Issue #585 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/585). Reviewed and rejected [Fix system test for scaffolds by siaw23 · Pull Request #586 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/586). Fixed with [Rails 8.1 system test support by flavorjones · Pull Request #590 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/590)
- Investigated [`tailwindcss-ruby` does not have options for `always` and `poll` · Issue #580 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/580). and removed `poll` in [Remove the "poll" option on the watch command by flavorjones · Pull Request #592 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/592)

### Reviews and user help

- Reviewed and tweaked [suppress caniuse-lite is outdated warning by wlipa · Pull Request #536 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/536)
- Helped people find a tighter reproduction in [Styles aren't generated when building a Docker image for ARM64 on a 2019 Intel MacBook Pro · Issue #17728 · tailwindlabs/tailwindcss](https://github.com/tailwindlabs/tailwindcss/issues/17728#issuecomment-2828356872)
- Reviewed [Implement Engines Support by bopm · Pull Request #554 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/554)
- Reviewed [Fix read-only file system issue by bopm · Pull Request #556 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/556)
- Rebased and merged [Address `warning: mismatched indentations at 'end' with 'class' at 3` by yahonda · Pull Request #569 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/569)
- Commented on [Default config should not watch `log` directory (and probably others) · Issue #491 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/491)
- Reviewed, tweaked, and merged [Added docker troubleshooting info to README by venarius · Pull Request #575 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/575)
- Reviewed and merged [Rename `on_stopped` to `after_stopped` for Puma 7 compatibility by rono23 · Pull Request #578 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/578)
- Reviewed and merged [Fix Puma plugin entry point issue by bopm · Pull Request #571 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/571)
- Reviewed, tweaked, and merged [Update README.md to add context around Tailwind 4 and PostCSS by thewatts · Pull Request #576 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/576)
- Reviewed and asked open-ended questions in [Allow customizing input/output via env variables by thewatts · Pull Request #577 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/577)
- Closed [Rails 8: 404 request to /assets/tailwindcss in fresh project with esbuild · Issue #581 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/581)

## [tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby)

### Releases

- [Release v4.1.4 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.4)
- [Release v4.1.5 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.5)
- [Release v4.1.6 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.6)
- [Release v4.1.7 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.7)
- [Release v4.1.8 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.8)
- [Release v4.1.10 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.10)
- [Release v4.1.11 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.11)
- [Release v4.1.12 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.12)
- [Release v4.1.13 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.13)
- [Release v4.1.16 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.16)
- [Release v3.4.19 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v3.4.19)
- [Release v4.1.18 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.18)

### Reviews and user help

- Helping upstream debug [CLI Watch never end 2 CPU cores at 100% · Issue #17246 · tailwindlabs/tailwindcss](https://github.com/tailwindlabs/tailwindcss/issues/17246)

## [rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock)

### Releases

(With Lars Kanis)

- [Release 1.11.0 / 2025-12-25 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/releases/tag/v1.11.0) with Ruby 4 support
- [Release 1.11.1 / 2025-12-26 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/releases/tag/v1.11.1) with JRuby 10 support

### Contributions

- Investigated failed image builds for musl platforms.
- [Bump the versions of Ruby in the MRI containers. by flavorjones · Pull Request #156 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/156)
- Investigated [Newly published docker images for v1.9.1? · Issue #162 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/issues/162). WTF.
- [Bumped](https://github.com/rake-compiler/rake-compiler-dock/pull/173) versions of Ruby 3.3 and 3.4 to the latest patch releases.
- [Added](https://github.com/rake-compiler/rake-compiler-dock/pull/175) support for Ruby 4.0. Opened an upstream Ruby bug report: [Bug #21792: 4.0.0-preview2: Build fails with `--with-ext=` when ENABLE_SHARED=yes: ruby/digest.h not found for rubyspec CAPI extensions](https://bugs.ruby-lang.org/issues/21792)
- [precompiled: add native support for ruby 4 by flavorjones · Pull Request #48 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/pull/48)
- [Update to Ruby 4.0.0 final inside the build containers by flavorjones · Pull Request #182 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/182)
- Chatted with Lars Kanis in [CI: The publish task doesn't work any longer · Issue #177 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/issues/177#issuecomment-3691546035)
- [Replace JRuby 9.4 with JRuby 10.0 in the JRuby build container by flavorjones · Pull Request #185 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/185)

### Reviews and user help

- [Answered](https://github.com/rake-compiler/rake-compiler-dock/issues/164) a question about platform flexibility.

## [ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained)

### Releases

- [Release v0.7.0 / 2025-09-14 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/releases/tag/v0.7.0)
- [Release v0.8.0 / 2025-12-27 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/releases/tag/v0.8.0)

### Contributions

- [precompiled: bump native ruby support to 4.0.0 final by flavorjones · Pull Request #49 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/pull/49)

### Reviews and user help

- Reviewed and extended [Don't assume shared library is installed relative to files in lib by deivid-rodriguez · Pull Request #44 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/pull/44)
- Reviewed and merged [Few fixes to make the packaged-tarball work by Edouard-chin · Pull Request #47 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/pull/47)
- Reviewed and merged [Add a `dir_config` for users on MacOS by Edouard-chin · Pull Request #46 · flavorjones/ruby-c-extensions-explained](https://github.com/flavorjones/ruby-c-extensions-explained/pull/46)

## [mini_portile](https://github.com/flavorjones/mini_portile)

### Releases

- Released [Release 2.8.9 / 2025-05-12 · flavorjones/mini_portile](https://github.com/flavorjones/mini_portile/releases/tag/v2.8.9)

### Contributions

- Tried to get CI green for OpenBSD: [ci: update ruby in the openbsd jobs by flavorjones · Pull Request #159 · flavorjones/mini_portile](https://github.com/flavorjones/mini_portile/pull/159)
- Got CI green with [ci: maintenance 2025-09 by flavorjones · Pull Request #163 · flavorjones/mini_portile](https://github.com/flavorjones/mini_portile/pull/163)

### Reviews and user help

- Reviewed and merged [Only load what is required from `cgi` by Earlopain · Pull Request #160 · flavorjones/mini_portile](https://github.com/flavorjones/mini_portile/pull/160) for Ruby 3.5 support
- Reviewed [Support cygwin. by kou1okada · Pull Request #162 · flavorjones/mini_portile](https://github.com/flavorjones/mini_portile/pull/162)

## [activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted)

### Releases

- [Release v0.6.0 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/releases/tag/v0.6.0)

### Contributions

- Merged the first external contribution!
- Fixed exception handling in the middleware to avoid the need for rack-contrib and depending on the path to public/404.
- Wrote up [feature: Tenant support in associations · Issue #201 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/issues/201)
- Opened PR [dependabot: scheduled for weekly by flavorjones · Pull Request #202 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/202)
- Investigated why [Rails `main` after `26d54e97` breaks parallel testing](https://github.com/basecamp/activerecord-tenanted/issues/210)
- Worked on overhauling the sqlite-specific bits, because I'm not sure the above PR got it right
- Wrote and merged [Move database path handling from BaseConfig into the SQLite adapter by flavorjones · Pull Request #215 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/215)
- [Use the ActiveRecord::QueryLogs API to inject into query logs by flavorjones · Pull Request #244 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/244)

### Reviews and user help

- Opened discussion [Rake tasks and background jobs: patterns for iterating over tenants · basecamp/activerecord-tenanted · Discussion #195](https://github.com/basecamp/activerecord-tenanted/discussions/195)
- Answered questions at [Multi-Database Support Limitations · basecamp/activerecord-tenanted · Discussion #183](https://github.com/basecamp/activerecord-tenanted/discussions/183)
- Opened discussion [Support for MySQL and PostgreSQL · basecamp/activerecord-tenanted · Discussion #194](https://github.com/basecamp/activerecord-tenanted/discussions/194)
- Answered [Add option to exclude default tenant in .tenants and with_each_tenant methods · basecamp/activerecord-tenanted · Discussion #208](https://github.com/basecamp/activerecord-tenanted/discussions/208)
- Responded to a question at [Rip out activerecord-tenanting · basecamp/fizzy@4d3c265](https://github.com/basecamp/fizzy/commit/4d3c26504262337fc25d79e72de32950c552bef2)
- Commented on [Change cache_key generation for TenantCommon by miguelmarcondesf · Pull Request #188 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/188/files#r2377127128)
- Reviewed [Show tenant earlier in inspect output by lairtonmendes · Pull Request #191 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/191)
- Reviewed [Change cache_key generation for TenantCommon by miguelmarcondesf · Pull Request #188 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/188)
- Reviewed and merged [Make sure debug is available in tests by andrewmarkle · Pull Request #200 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/200)
- Reviewed [#201 | Enhanced tenanted and untenanted associations by miguelmarcondesf · Pull Request #205 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/205)
- Reviewed [Extract SQLite into an adapter by andrewmarkle · Pull Request #204 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/204)
- Reviewed and merged [Extract SQLite into an adapter by andrewmarkle · Pull Request #204 · basecamp/activerecord-tenanted](https://github.com/basecamp/activerecord-tenanted/pull/204)

## [http-cookie](https://github.com/sparklemotion/http-cookie)

### Releases

- Released [Release 1.1.0 · sparklemotion/http-cookie](https://github.com/sparklemotion/http-cookie/releases/tag/v1.1.0)

### Contributions

- Fixed up [Add `#to_h` to cookie.rb by luke-hill · Pull Request #55 · sparklemotion/http-cookie](https://github.com/sparklemotion/http-cookie/pull/55)

### Reviews and user help

- Reviewed [Add `#to_h` to cookie.rb by luke-hill · Pull Request #55 · sparklemotion/http-cookie](https://github.com/sparklemotion/http-cookie/pull/55#pullrequestreview-3034150591) 😐
- Reviewed and merged [Reduce gem size by excluding test files by yuri-zubov · Pull Request #54 · sparklemotion/http-cookie](https://github.com/sparklemotion/http-cookie/pull/54)

## [rails-html-sanitizer](https://github.com/rails/rails-html-sanitizer)

### Contributions

- Got CI green: [ci: bump the matrices by flavorjones · Pull Request #205 · rails/rails-html-sanitizer](https://github.com/rails/rails-html-sanitizer/pull/205)

### Reviews and user help

- Reviewed [If passed Range shorthand (duck typed), handle as text by nacengineer · Pull Request #203 · rails/rails-html-sanitizer](https://github.com/rails/rails-html-sanitizer/pull/203)

## [rails-dom-testing](https://github.com/rails/rails-dom-testing)

### Reviews and user help

- Reviewed and merged [Fix broken Nokogiri documentation links in README.md by mikeygough · Pull Request #126 · rails/rails-dom-testing](https://github.com/rails/rails-dom-testing/pull/126)

## [trix](https://github.com/basecamp/trix)

### Releases

- [Release v2.1.16 · basecamp/trix](https://github.com/basecamp/trix/releases/tag/v2.1.16)

### Contributions

- [Create a ruby gem package "action_text-trix" by flavorjones · Pull Request #1234 · basecamp/trix](https://github.com/basecamp/trix/pull/1234)
- [ci: fix apt-install errors by flavorjones · Pull Request #1262 · basecamp/trix](https://github.com/basecamp/trix/pull/1262)
- [Revert "Toolbar Button: Handle `click` instead of `mousedown`" by flavorjones · Pull Request #1269 · basecamp/trix](https://github.com/basecamp/trix/pull/1269)
- [ci: stabilize Sauce Labs with SC5 tunnel by flavorjones · Pull Request #1271 · basecamp/trix](https://github.com/basecamp/trix/pull/1271)
- [Fix XSS vulnerability in attachment href rendering · basecamp/trix@73c20cf](https://github.com/basecamp/trix/commit/73c20cf03ab2b56c0ef9c9b1aaf63f2de44f4010)
- [Replace Karma with `@web/test-runner` by flavorjones · Pull Request #1272 · basecamp/trix](https://github.com/basecamp/trix/pull/1272)

### Reviews and user help

- Rebased [Read initial editor value from HTML content by seanpdoyle · Pull Request #1253 · basecamp/trix](https://github.com/basecamp/trix/pull/1253)
- Reviewed and merged [Pass CI by seanpdoyle · Pull Request #1255 · basecamp/trix](https://github.com/basecamp/trix/pull/1255) and [Update `.node-version` and `engine` property in `package.json` by seanpdoyle · Pull Request #1257 · basecamp/trix](https://github.com/basecamp/trix/pull/1257) to get CI green.
- Reviewed and merged [Build `action_text-trix` assets with existing tools by seanpdoyle · Pull Request #1256 · basecamp/trix](https://github.com/basecamp/trix/pull/1256)
- Reviewed [action_text-trix: Add test coverage for Engine by seanpdoyle](https://github.com/basecamp/trix/pull/1258)

## Other OSS Contributions

### Contributions

- [Ensure that `Jbuilder.encode` properly forwards arguments to `.new` by flavorjones · Pull Request #601 · rails/jbuilder](https://github.com/rails/jbuilder/pull/601)
- [Pass compatible function pointer type to rb_ensure for GCC 15 by flavorjones · Pull Request #29 · ruby/iconv](https://github.com/ruby/iconv/pull/29)
- [Fix qualified constant lookup to respect module/class context by flavorjones · Pull Request #1981 · presidentbeef/brakeman](https://github.com/presidentbeef/brakeman/pull/1981)
- [MT6: Update `Minitest::Benchmark.run` with the correct method signature by flavorjones · Pull Request #1050 · minitest/minitest](https://github.com/minitest/minitest/pull/1050)
- [Update CRuby releases on Windows to include Ruby 4.0.0 by flavorjones · Pull Request #846 · ruby/setup-ruby](https://github.com/ruby/setup-ruby/pull/846)

## [Rubygems](https://github.com/rubygems/rubygems)

### Contributions

- Commented on [[Proposal] Improved support for binary gems · rubygems · Discussion #8645](https://github.com/orgs/rubygems/discussions/8645)
- Filed bug report with repro: [Reliable reproduction of the "fatal: No live threads left. Deadlock" issue · Issue #8972 · rubygems/rubygems](https://github.com/rubygems/rubygems/issues/8972)

## [Rubygems.org](https://rubygems.org)

### Contributions

- Onboarded to the Rubygems.org on-call rotation

## TruffleRuby

### Contributions

- Updated my nightly docker build scripts because the 20.04 build was dropped: [move to the 22.04 tarball · flavorjones/truffleruby@436eae1](https://github.com/flavorjones/truffleruby/commit/436eae18a8e7df9a69e614d3a9dd99a84f4c27f8)


Thank you for reading and thank you for your support!

❤️❤️❤️,<br>
-mike
