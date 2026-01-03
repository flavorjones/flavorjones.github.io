---
title: Open Source Update / April '25
short: |
  An update on my open source work.
date: 2025-04-06
---

# Open Source Update / April '25

2025-04-06, originally sent directly to open-source sponsors. See [previous update](/posts/2025/03/open-source-update.html).
{: .text-sm .italic .opacity-75 }

[Ahoy hoy](https://en.wiktionary.org/wiki/ahoy-hoy)!

The last month has been pretty busy, and I haven't had as much time as I wanted to invest in open source. Some notable events in my personal life: my daughter got her driver's license 😅 and I hit the six-month mark at 37 signals 😲!

Despite being a bit busy, I feel like I still got quite a bit done Here's an overview of what I shipped in the last month ...


## [Nokogiri](https://github.com/sparklemotion/nokogiri)

### Releases

- [Release v1.18.4 / 2025-03-14 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.4)
  - and wrote the accompanying GHSA [Nokogiri updates packaged libxslt to v1.1.43 to resolve multiple CVEs · Advisory · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-mrxw-mxhj-p664)
- [Release v1.18.5 / 2025-03-19 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.5) to unblock a major ruby-saml release.
- [Release v1.18.6 / 2025-03-24 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.6)
- [Release v1.18.7 / 2025-03-31 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.7)

### Contributions

- Fixed a JRuby namespace bug when creating a new element: [fix(jruby): create_element should not set the doc's default ns by flavorjones · Pull Request #3463 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3463)
- Removed the JRuby implementation's namespace cache, which was causing subtle issues: [fix(java): stop using the cache for Node#namespace_definitions by flavorjones · Pull Request #3460 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3460)
- Fixed a Builder namespace issue: [fix: XML::Builder namespace stitching by flavorjones · Pull Request #3461 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3461)
- Added downstream ruby-saml testing for JRuby: [ci: add jruby coverage for ruby-saml by flavorjones · Pull Request #3465 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3465)
- Updated vendored libxslt to 1.1.43: [dep: update libxslt to 1.1.43 (v1.18.x branch) by flavorjones · Pull Request #3467 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3467)
- Updated vendored libxml to v2.13.7: [dep: bump libxml2 to 2.13.7 by flavorjones · Pull Request #3494 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3494)
- Fixed a JRuby regression [fix(jruby): Node#attribute in HTML documents by flavorjones · Pull Request #3490 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3490).
- Work in progress:
  - Another subtle namespace issue, which needs more work to not break downstream projects: [fix(cruby): reconciliation of ns on unparented nodes by flavorjones · Pull Request #3462 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3462)
  - Simplifying library linking on windows: [IN_LIBXML no longer needed for windows linkage by flavorjones · Pull Request #3475 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3475)
  - An API improvement: [feat: Implement Document#parent, which always returns nil by flavorjones · Pull Request #3481 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3481)
  - Updating vendored libxml to v2.14.1, which promises to be a nice performance improvement, particularly for XPath queries: [dep: update packaged libxml2 to v2.14.1 by flavorjones · Pull Request #3499 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3499)

### Reviews and user help

- Reviewed some great work by Johnny Shields to fix a JRuby issue that was blocking a ruby-saml release [Fix MRI Ruby vs. JRuby XML child namespace output differences by johnnyshields · Pull Request #3456 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3456)
- Charlie Nutter contributed:
  - General JRuby cleanup: [Clean up and modernize the JRuby extension by headius · Pull Request #3478 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3478)
  - JRuby 10 support: [Fixes for recent JRuby updates by headius · Pull Request #3477 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3477)
- Documentation improvements from Burdette and Anton:
  - [Doc for Node#add_child by BurdetteLamar · Pull Request #3453 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3453)
  - [Tweaks for Node subclass list by BurdetteLamar · Pull Request #3471 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3471)
  - [doc: Nokogiri::XML::Node.traverse is recursively called on children first by AntonKhorev · Pull Request #3480 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3480)

## [tailwindcss-rails](https://github.com/rails/tailwindcss-rails)

### Releases

- [Release v4.2.1 / 2025-03-19 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.2.1)
- [Release v4.2.2 / 2025-04-05 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.2.2)

### Contributions

- Fixing failing upgrade tests in CI. After two dead ends, finally figured it out in [ci: use the latest @tailwindcss/upgrade package by flavorjones · Pull Request #529 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/529).
- Improve troubleshooting when things go wrong: [Improve the state of debugging when things go wrong by flavorjones · Pull Request #530 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/530)

### Reviews and user help

- Some more contributions from Patricio to improve the scaffold templates:
  - [Fix hardcoded attribute in form by patriciomacadden · Pull Request #513 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/513)
  - [add accept_confirm if turbo is available so system tests don't fail. fixes #519 by patriciomacadden · Pull Request #520 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/520)
  - [Simplify markup by patriciomacadden · Pull Request #523 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/523)
- Spent time focusing on some user issues, including:
  - [Tailwind live rebuild doesn't work on new application when modifying a view · rails/tailwindcss-rails · Discussion #522](https://github.com/rails/tailwindcss-rails/discussions/522)
  - [new rails application stalls at tailwind install/build · Issue #509 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/509#issuecomment-2752751168)
- Reviewed a proposal for engine support: [Implement Engines support by bopm · Pull Request #484 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/484)


## [tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby)

### Releases

- [Release v4.0.14 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.14)
- [Release v4.0.15 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.15)
- [Release v4.0.16 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.16)
- [Release v4.0.17 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.17)
- [Release v4.1.3 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.1.3)

### Contributions

- Cleaning up the CI workflows:
  - [ci: unify installation testing into a single matrix by flavorjones · Pull Request #71 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/pull/71)
  - [ci: unify main and packaging workflows into ci.yml by flavorjones · Pull Request #72 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/pull/72)


## [sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby)

### Reviews and user help

- Investigated a report of a performance regression, which I narrowed down to upstream changes in sqlite v3.46.0. [Unexpected regression in query plan between 1.7.3 and 2.0.0 · Issue #619 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/619)


## [Rails](https://github.com/rails/rails)

### Contributions

- Fixed a longstanding issue with the sqlite3 adapter's handling of "Infinity": [fix: sqlite3 adapter should quote Infinity and NaN by flavorjones · Pull Request #54735 · rails/rails](https://github.com/rails/rails/pull/54735)


## [mini_portile](https://github.com/flavorjones/mini_portile)

### Contributions

- Fixing Windows CI failures: [ci: windows images no longer support older cmake versions by flavorjones · Pull Request #157 · flavorjones/mini_portile](https://github.com/flavorjones/mini_portile/pull/157)

<br>

Thank you for reading and thank you for your support!

❤️❤️❤️,<br>
-mike
