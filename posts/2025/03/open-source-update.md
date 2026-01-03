---
title: Open Source Update / March '25
short: |
  The first of a (hopefully) regular series of updates on my open source work.
date: 2025-03-08
---

# Open Source Update / March '25

2025-03-08, originally sent directly to open-source sponsors
{: .text-sm .italic .opacity-75 }

Hello!

I'm trying something new! I'm going to start writing a periodic post about the open source work I'm doing.

Because this post is trying to cover three months, it's a bit long, and if I'm honest it feels a bit overwhelming to present you with this list. I apologize if it's not-so-interesting! I'm hoping the next one will be a bit more conversational and quite a bit shorter. Please let me know if this is helpful and informational, or if you'd like to see more info (or less!) in the next one.

So far in 2025, here's an overview of the work I've done in the Ruby open-source community ...

## Nokogiri

### Releases

- [Release v1.18.2 / 2024-01-19 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.2)
- [Release v1.18.3 / 2025-02-18 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/releases/tag/v1.18.3)
    - and the accompanying GHSA [Nokogiri updates packaged libxml2 to 2.13.6 to resolve CVE-2025-24928 and CVE-2024-56171 · Advisory · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-vvfq-8hwr-qm4m)

### Contributions

- Worked a bit with the upstream libxml2 maintainer, Nick Wellnhofer, to reproduce xpath issues in [XPath optimizations (!293) · Merge requests · GNOME / libxml2 · GitLab](https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/293)
- Working on [XPath performance improvements · Issue #3403 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3403), which will land once libxml 2.14 is released.
    - These changes, when combined with the upstream libxml2 improvements, show a stunning speedup of ~12x on XPath queries in my benchmarks. 🚀
- Investigated [Nokogiri::XML::Document#css no longer matches namespaced XML attributes · Issue #3411 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3411)
    - And fixed it in [fix(css-selector): default XML namespace is not applied to wildcard by flavorjones · Pull Request #3413 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3413)
- Did another round of html5lib error-message-correcting in [Update tests for relaxed select parser by josepharhar · Pull Request #178 · html5lib/html5lib-tests](https://github.com/html5lib/html5lib-tests/pull/178)
- Created [Deprecate `Nokogiri::HTML4::ElementDescription` · Issue #3443 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3443), which will be deprecated in an upcoming release.
- Wrote up an issue [Update parse options to reflect modern libxml usage · Issue #3439 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3439)
- Closed [RFC: Increase `Nokogiri::Gumbo::DEFAULT_MAX_ERRORS` to a positive number · sparklemotion/nokogiri · Discussion #3248](https://github.com/sparklemotion/nokogiri/discussions/3248) after much consideration.

### Reviews and user help

So far this year, Nokogiri is getting some documentation love and attention from [Burdette Lamar](https://github.com/BurdetteLamar)! ❤️

- Reviewed and merged [Parse options doc by BurdetteLamar · Pull Request #3360 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3360#pullrequestreview-2561069184)
- Reviewed and merged [New doc for modernized call-seqs (kwargs) by BurdetteLamar · Pull Request #3362 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3362)
- Reviewed and merged [Parse options doc by BurdetteLamar · Pull Request #3360 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3360)
- Reviewed [Revision for XML::Node.add_child by BurdetteLamar · Pull Request #3431 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3431#pullrequestreview-2626911085)
- Reviewed and merged [In XML::ParseOptions.rb put :nodoc: onto constants SAX1 and NODICT by BurdetteLamar · Pull Request #3447 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3447)
- Reviewed and merged [Add links to local pages in README.md by BurdetteLamar · Pull Request #3449 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3449#pullrequestreview-2641964958)
- Commented on the proposed format in [Method documentation summary · Issue #3450 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3450)

The user help queue was lighter than usual:

- Wrote up an example solution at [How to find all matches of a link in a document using Nokogiri · sparklemotion/nokogiri · Discussion #3420](https://github.com/sparklemotion/nokogiri/discussions/3420)
- Answered questions at [Partial script tag not being sanitized · Issue #3444 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/issues/3444)

And Nokogiri has a new contributor!

- Merged [Drop `Struct::HTMLElementDescription` class by viralpraxis · Pull Request #3433 · sparklemotion/nokogiri](https://github.com/sparklemotion/nokogiri/pull/3433)


## rake-compiler-dock

### Releases

- [Release v1.7.1 / 2025-01-03 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/releases/tag/v1.7.1)
- [Release v1.8.0 / 2025-01-05 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/releases/tag/v1.8.0)
- [Release v1.9.0 / 2025-01-19 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/releases/tag/v1.9.0)
- [Release v1.9.1 / 2025-01-20 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/releases/tag/v1.9.1)

### Contributions

The big improvement this cycle was for all the build images to contain updated Ruby versions and dependencies, and some features to help gem maintainers work with those images.

- Created [dep: update images to rake-compiler v1.2.9 by flavorjones · Pull Request #139 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/139)
- Created an [Actions pipeline to automatically ship container images for releases](https://github.com/rake-compiler/rake-compiler-dock/blob/main/.github/workflows/release-images.yml)
- Bumped all the Ruby versions in [dep: bump all rubies' patch level by flavorjones · Pull Request #135 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/135)
- Wrote [Allow gems to set `required_ruby_version = '>= 3.2.0'` by flavorjones · Pull Request #146 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/146)
- Proposed [RFC: Provide easy access to the cross-rubies from the build process · Issue #149 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/issues/149)
    - And implemented [feat: introduce RakeCompilerDock.set_ruby_cc_version by flavorjones · Pull Request #150 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/150)

I'm also preparing for the next release:

- Reviewed and expanded [Drop support for Ruby 2.4, 2.5, and 2.6 by ianks · Pull Request #153 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/153)
- Briefly investigated the build problem in [Set RUBY_CC_VERSION using RakeCompilerDock.set_ruby_cc_version by stanhu · Pull Request #167 · mudge/re2](https://github.com/mudge/re2/pull/167) which seems to be due to rake-compiler's fake.rb rbconfig. 🤷
    - And wrote a workaround in [feat: allow easier selection of the ruby run in the container by flavorjones · Pull Request #151 · rake-compiler/rake-compiler-dock](https://github.com/rake-compiler/rake-compiler-dock/pull/151/files), which I'm not sure is needed, so I haven't merged yet.

## tailwindcss-rails

### Releases

- [Release v3.2.0 / 2025-01-10 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v3.2.0)
- [Release v3.3.0 / 2025-01-19 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v3.3.0)
- [Release v3.3.1 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v3.3.1)
- [Release v4.0.0 / 2025-02-01 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.0.0)
- [Release v4.1.0 / 2025-02-19 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.1.0)
- [Release v4.2.0 / 2025-03-02 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/releases/tag/v4.2.0)

### Contributions

TailwindCSS v4 was released, and so I spent quite a bit of time making sure the upgrade experience was as good as it could be. 😅

- Opened an epic to track progress: [Improve support for Tailwind CSS v4 · Issue #462 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/462)
- Wrote [dep: pin tailwindcss-ruby to `~> 3.0` by flavorjones · Pull Request #468 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/468)
- Wrote [Introduce proper v4 support by flavorjones · Pull Request #464 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/464)
- Wrote [Introduce a 'tailwindcss:upgrade' task by flavorjones · Pull Request #466 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/466)
- Wrote [doc: add upgrade notes to the README by flavorjones · Pull Request #467 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/467)
- Wrote [test: restore the ability to inject tailwindcss-ruby bundler opts by flavorjones · Pull Request #472 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/472)
- Wrote [fix: unnecessary stylesheet_link_tag for tailwind by flavorjones · Pull Request #473 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/473)
- Wrote [Move application.tailwind.css to a dir ignored by propshaft by flavorjones · Pull Request #474 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/474)
- Wrote [Properly invoke the initializer to have Propshaft ignore tailwind by flavorjones · Pull Request #479 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/479)
- Wrote [Rename application.tailwind.css to application.css by flavorjones · Pull Request #481 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/481)
- Wrote [Prep docs and post-install message for final release by flavorjones · Pull Request #485 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/485)
- Investigated [Default config should not watch `log` directory (and probably others) · Issue #491 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/491)
- Investigated [v4 not building in x86_64 container built on arm64 mac · Issue #497 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/issues/497)

Unrelated to the v4 upgrade:

- Wrote [feat: support running the puma plugin in a bare puma process by flavorjones · Pull Request #459 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/459)


### Reviews

I had lots of help with the v4 upgrade:

- Reviewed and merged [Update README for postcss configuration for v4 by EricGusmao · Pull Request #476 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/476)
- Reviewed and merged [doc: update README with TailwindCSS v4 upgrade instructions by EricGusmao · Pull Request #480 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/480), tweaked and merged
- Reviewed and merged [Fix: update postcss config path to match new structure by EricGusmao · Pull Request #482 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/482)
- Reviewed and merged [doc: Add to v3-v4 upgrade guide about custom css files by frayzil · Pull Request #486 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/486)
- Reviewed and merged [Update Readme link for fingerprinting by hachi8833 · Pull Request #500 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/500)

But also Patricio Mac Adden spent some time cleaning up the view templates!

- Reviewed and merged [Improve scaffold views by patriciomacadden · Pull Request #452 · Rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/452)
- Reviewed and merged [improve partial: correct use of tags + attachment links styling by patriciomacadden · Pull Request #460 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/460)
- Reviewed and merged [Improve boolean fields by patriciomacadden · Pull Request #454 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/454)
- Reviewed and merged [index: show the actions to the right of the partial and add a division by patriciomacadden · Pull Request #461 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/461)
- Reviewed and merged [Add confirm prompt if turbo is available by patriciomacadden · Pull Request #498 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/498#pullrequestreview-2627273623)
- merged [Improve views for mobile devices by patriciomacadden · Pull Request #503 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/503)

And a small improvement:

- Reviewed and merged [Tailwindcss debug environment variable by r-sierra · Pull Request #504 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/504)

Also, I've been collaborating on some proposed features to better support Rails engines:

- Reviewed [Implement Engines support by bopm · Pull Request #484 · rails/tailwindcss-rails](https://github.com/rails/tailwindcss-rails/pull/484)


## tailwindcss-ruby

### Release

- [Release v4.0.1 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.1)
- [Release v4.0.2 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.2)
- [Release v4.0.3 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.3)
- [Release v4.0.4 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.4)
- [Release v4.0.5 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.5)
- [Release v4.0.6 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.6)
- [Release v4.0.7 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.7)
- [Release v4.0.8 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.8)
- [Release v4.0.9 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.9)
- [Release v4.0.12 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/releases/tag/v4.0.12)

### Contributions

Again, the TailwindCSS v4 release resulted in a bit of work:

- Added support for separate Musl and GNU executables in [dep: update to Tailwind CSS v4.0.0-beta.9, ship separate gnu and musl gems by flavorjones · Pull Request #43 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/pull/43)
- Wrote [ci: add a downstream integration test with rails for upgrades by flavorjones · Pull Request #48 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/pull/48)
- Investigating [Tailwind 4: Can't compile on Docker linux/amd64 · Issue #49 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/issues/49)
- Investigating [Notice: users report `SIGILL` or `Illegal instruction` when running tailwindcss in x86_64 docker containers · Issue #55 · flavorjones/tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby/issues/55)
- Helping a user investigate [deploying to linux ubuntu server (x86_64-linux) Gem::RemoteFetcher::FetchError · flavorjones/tailwindcss-ruby · Discussion #62](https://github.com/flavorjones/tailwindcss-ruby/discussions/62)


## sqlite3-ruby

Upstream sqlite re-implemented their "autoconf" scripts, which broke the gem's build process on windows and made it challenging to cut a release.

### Releases

- [Release v2.6.0 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v2.6.0) with an update to sqlite3 3.49.1

### Contributions

- Asking the community for help in [`Database#load_extensions` is not enabled on Windows when using native gems or compiling vendored source code (sqlite 3.48.0+) · Issue #618 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/618) after banging my head against the build scripts.
- Investigated [`SQLite3::TestDatabaseURI` test failures with system sqlite · sparklemotion/sqlite3-ruby · Discussion #612](https://github.com/sparklemotion/sqlite3-ruby/discussions/612)
    - And fixed it in [test: skip database URI tests when using system libraries by flavorjones · Pull Request #613 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/613)
- Investigated [Encoding error on s390x · Issue #615 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/issues/615)
    - And fixed it in [fix: tests pass on bigendian architecture by flavorjones · Pull Request #616 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/616)

### Reviews

Aaron Patterson has started exploring improving Ractor support:

- Reviewed and merged [Freeze strings and constants in pragmas by tenderlove · Pull Request #620 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/620)
- Reviewed and merged [Try to simplify pragma related constants by tenderlove · Pull Request #621 · sparklemotion/sqlite3-ruby](https://github.com/sparklemotion/sqlite3-ruby/pull/621)

## Mechanize

### Releases

- [Release 2.13.0 / 2025-01-02 · sparklemotion/mechanize](https://github.com/sparklemotion/mechanize/releases/tag/v2.13.0)
- [Release 2.14.0 / 2025-01-05 · sparklemotion/mechanize](https://github.com/sparklemotion/mechanize/releases/tag/v2.14.0)

### Contributions

- Reviewed and merged [Fix frozen string warning for Ruby 3.4 by simpl1g · Pull Request #661 · sparklemotion/mechanize](https://github.com/sparklemotion/mechanize/pull/661?new_mergebox=true)
- Wrote [quash Ruby 3.4 URI::Parser warnings by flavorjones · Pull Request #662 · sparklemotion/mechanize](https://github.com/sparklemotion/mechanize/pull/662)
- Co-authored [Support Net::HTTP::Persistent.write_timeout by flavorjones · Pull Request #663 · sparklemotion/mechanize](https://github.com/sparklemotion/mechanize/pull/663)

## RDoc

- Was invited to become a committer! 🙇
- Opened PR to improve docs.ruby-lang.org [rdoc: Enable the "embed mixins" feature by flavorjones · Pull Request #12858 · ruby/ruby](https://github.com/ruby/ruby/pull/12858)

## Rails

- Investigated [ActionView: Rendering a template with strict locals should not rewrite ArgumentErrors · Issue #52227 · rails/rails](https://github.com/rails/rails/issues/52227)
    - And fixed it in [fix: `ArgumentError`s raised during template rendering by flavorjones · Pull Request #54133 · rails/rails](https://github.com/rails/rails/pull/54133)
- Wrote [Action View: fix local variable access in layouts by flavorjones · Pull Request #54020 · rails/rails](https://github.com/rails/rails/pull/54020#event-15830947035) which has been merged
- Wrote [feat: Authentication generator's `SessionsController` clears browser cache at logout by flavorjones · Pull Request #54230 · rails/rails](https://github.com/rails/rails/pull/54230) which was merged but then later reverted because browser support is sketchy for this feature
- Investigated [PoolConfig caches the connection_class, which breaks if it is reloaded · Issue #54343 · rails/rails](https://github.com/rails/rails/issues/54343#issuecomment-2613181340)
    - And fixed it in [`PoolConfig` no longer keeps a reference to the connection class (attempt 3) by flavorjones · Pull Request #54366 · rails/rails](https://github.com/rails/rails/pull/54366)
- Wrote [Clear AR connections in tests before forking for parallelization by flavorjones · Pull Request #54376 · rails/rails](https://github.com/rails/rails/pull/54376) with Donal McBreen, which was merged
- Working on improving [ActionText::ContentHelper.allowed_tags (and attributes) are no longer easily added to · Issue #54478 · rails/rails](https://github.com/rails/rails/issues/54478#issuecomment-2646761378)
- Trying to recruit a new open-source contributor in [`assert_dom` should ignore whitespace just like `assert_dom_equal` · Issue #121 · rails/rails-dom-testing](https://github.com/rails/rails-dom-testing/issues/121) 😉

## Active Hash

- Drafted [Update CI with Ruby 3.4, fix Rails Logger constant resolution issue by flavorjones · Pull Request #328 · active-hash/active_hash](https://github.com/active-hash/active_hash/pull/328), but still waiting for a co-maintainer to approve 🫤

## Loofah

- Drafted [Introduce an `acts_as_loofah` method by flavorjones · Pull Request #293 · flavorjones/loofah](https://github.com/flavorjones/loofah/pull/293)
    - ... Which would close this 15-year-old issue! [feature: allow Loofah-ization of an existing Nokogiri document or fragment · Issue #13 · flavorjones/loofah](https://github.com/flavorjones/loofah/issues/13)
    - (I haven't merged this yet, I think it needs a bit more polishing)

## Rubocop

- Wrote [Introduce EnforcedStyleForMultiline "diff_comma" by flavorjones · Pull Request #13806 · rubocop/rubocop](https://github.com/rubocop/rubocop/pull/13806)
    - ... Which was merged and released in v1.7.3

## hoe-markdown

- Released [Release v1.7.0 / 2025-01-02 · flavorjones/hoe-markdown](https://github.com/flavorjones/hoe-markdown/releases/tag/v1.7.0)
- Reviewed and merged [Ignore link refs and link ref definitions by halostatue · Pull Request #5 · flavorjones/hoe-markdown](https://github.com/flavorjones/hoe-markdown/pull/5)
- Invited Austin Ziegler to be a collaborator


If you got this far, thank you for reading and thank you for your support!

❤️❤️❤️,<br>
-mike
