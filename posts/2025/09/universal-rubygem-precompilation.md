---
title: Universal Rubygem Precompilation
short: |
  A summary of the current state of precompiled native gems in the Ruby ecosystem.
date: 2025-09-10
---

# Universal rubygem precompilation

2025-09-10
{: .text-sm .italic .opacity-75 }

## Context

Precompiling Nokogiri and SQLite was an unmitigated success for users in terms of installation speed and reliability, but the intensive effort required to set up precompilation and the testing matrix makes it inaccessible for many maintainers.

Tools like `uv` have demonstrated how amazing it is to be able to install dependencies quickly, but without a broad set of precompiled ruby gems, the benefits of a similar `rv` project would be limited.

This brief attempts to answer:

- What's the current state of ongoing work to make it easier to precompile gems?
- What would it take to precompile the universe of Ruby gems with native extensions?

## Current state

The current tooling, maintained in part by your humble author, relies primarily on cross-compiling on Linux for (mostly) historical reasons. Maintaining this Linux toolchain (cross-compilers and libraries to support various Windows and macOS (Darwin) versions, a hacked Ruby build system, all wrapped up in OCI images) is complex and brittle compared to the more simple process of compiling on the target platform.

The current gemspec has a few drawbacks which limit the platforms that can be targeted, and require that binary gems must package multiple ruby versions together ("fat gems").

Discussions have been ongoing, primarily between myself, Ruby Core member Soutou Kouhei (`@kou`), and Rubygems contributor Samuel Giddins (`@segiddins`), on evolving the gem specification and the tooling to better support precompiled libraries.


## Evolving the specification

Some recent discussions have been driving decisions about evolving both the gem specification and the tooling for precompiling gems.

- 2025-02: Sam's [brainstorming post about binary gems](https://traveling.engineer/posts/goals-for-binary-gems/)
- 2025-04: Rubygems [discussion](https://github.com/orgs/rubygems/discussions/8645) created in response to Sam's post
- 2025-08: [Precompiled gem v2 RFC](https://github.com/rubygems/rfcs/pull/60)
  - [Readable document](https://github.com/segiddins/rfcs/blob/segiddins/wheels/text/0000-improved-binary-gem-support.md)

These discussions have been ongoing for a few years, but Sam's paid position at Ruby Central allowed him to focus on this long enough to generate a reasonable RFC inspired by Python's [Wheels specification](https://pythonwheels.com/) and informed by the ["Wheel Next" project](https://wheelnext.dev/).

Participants in the discussions, in the above links and elsewhere, include:

- Ruby maintainers across CRuby, TruffleRuby, and JRuby: nurse, kou, byroot, eregon, headius, tagomoris
- Gem maintainers: flavorjones
- Downstream distros: voxik

Highlights from the recent RFC:

- Fine-grained platform matching on { Ruby ABI, OS, OS version, CPU architecture, libc implementation, libc version }.
- Proper support for WASM, JRuby and TruffleRuby, and extensions for future Ruby implementations.
- Platform tags for flexible specifications (e.g., specific architecture, minimum libc version, OS version) that can be ORed together.

### Open question: Rubygems and Bundler support

There's obviously quite a bit of work that will need to be done in the rubygems and bundler projects to support the new gem specification. It's unclear, given Sam's departure from his salaried position at Ruby Central, whether anyone will have the resources to execute on this in the near future.


## Evolving the tooling

In the 2025-04 [Rubygems discussion](https://github.com/orgs/rubygems/discussions/8645) linked above, kou and myself also discussed how to evolve the tooling.

I think we achieved consensus around a few points:

- Starting with CI-focused tooling usable in OCI containers, to allow maintainers to compile easily using Github Actions or other cloud CI systems (as well as local development environments).
- Focusing on native compilation, and dropping the rake-compiler-dock cross-compilation approach.

Inspiration from the Python community is the [cibuildwheel project](https://cibuildwheel.pypa.io/en/stable/) which provides CI-focused support for a large matrix of Python versions and platforms.

### Open question: Improving the tooling

The execution path here is pretty clear, but will require focused effort to get great, well-documented software that will work for a wide variety of gems.

### Open question: Binary library issues

There are known issues when shared libraries are statically linked in a Ruby gem (e.g., Nokogiri with libxml2, OpenSSL with libopenssl or LibreSSL) which are currently being debated and worked around in various ways.

- [RFC: Stop exporting symbols · sparklemotion/nokogiri · Discussion #2746](https://github.com/sparklemotion/nokogiri/discussions/2746)
  - Related: [rake-compiler/rake-compiler-dock#87](https://github.com/rake-compiler/rake-compiler-dock/issues/87)
  - Related: [sparklemotion/sqlite3-ruby#371](https://github.com/sparklemotion/sqlite3-ruby/pull/371)
- [Comment by nurse in the Binary gems RFC](https://github.com/rubygems/rfcs/pull/60#discussion_r2300224163)

Similarly, the variations on ways to build Ruby can make it challenging to support any arbitrary Ruby (e.g., ENABLED_SHARED can be set on or off). See Luis Lavena's comment on this [here](https://x.com/luislavena/status/1383071440019333130).

> There is also the challenge that each Ruby install build differently, ruby-build, rvm and others
> use different flags that affect how extensions are loaded. So much fun!😅

Ruby namespaces, due to be introduced as an experimental feature in Ruby 3.5, may provide better tooling around this (e.g., [this commit in Ruby calling `dlopen` with RTLD_LOCAL instead of RTLD_GLOBAL](https://github.com/ruby/ruby/commit/382645d440d5da66a0c04557f3ff2ca226de3a27#diff-9c24c55048e3300ee547924dfe6e137a388e4d6b910b8e3c474288499db381cfL388-R393)).


## Build farms

### Prior art: Luis Lavena's proof-of-concept

In 2020, Luis Lavena (former maintainer of the Windows RubyInstaller project) posted some tweets demonstrating a proof-of-concept precompilation of native gems:

- 2020-09-04 [https://x.com/luislavena/status/1302024713036869634](https://x.com/luislavena/status/1302024713036869634)

There were enough complications around binary compatibility to make Luis suspend his efforts, as reflected in his followup tweets [here](https://x.com/luislavena/status/1383070947331223554) and [here](https://x.com/luislavena/status/1383071440019333130):

> There are several challenges on this (build infra & cost & gem authors) but http://rubygems.org
> not allowing different Ruby's ABI for same gem version (forcing the fat-binary thing) which
> complicates build process 😿 Been working on something for this.
>
> There is also the challenge that each Ruby install build differently, ruby-build, rvm and others
> use different flags that affect how extensions are loaded. So much fun!😅

### What's needed

If we had improved CI-focused tooling in place, and the more flexible gem specification was adopted, then a build farm is feasible if someone has enough money.

In my mind, this would take the form of a build process that would automate something like the testing matrix described at flavorjones's [ruby-c-extensions-explained project](https://github.com/flavorjones/ruby-c-extensions-explained/tree/main/precompiled#testing):

- When a new any/any gem is published,
- For a matrix of Ruby versions and platforms,
  - Spin up a container specific to that combination and ...
    - Attempt to compile the gem natively
    - If successful, package the compiled library into a binary gem
  - In a new container, install the gem and ...
    - Run the test suite
    - If successful, publish the binary gem

Some developer experience things we should think about:

- The process will need to be opt-in, in order to grant publishing permissions. **How do we make opting-in as easy as possible?**
- Many gems will fail for many or most of the matrix. **How does the developer get fast feedback to make the gem compatible?**

### Open question: Do we really need a build farm?

I suspect that many gems' native extensions are going to be difficult to automate, either because

- they lack a thorough test suite
- they lack a formal definition of their dependencies, or don't install their dependencies

If the CI-focused tooling is easy enough to use, especially on Github, could we make it trivial to opt-in to the tooling to build and test precompiled, fully attestated binary package? I think we probably can.


## Related topics

### Declaring external dependencies to avoid compilation

Many (most?) C extensions exist only to integrate with a C/C++/Rust shared library. For many years, there have been ad-hoc methods of declaring a gem dependency on an external library, to either make compiling the C extension very quick, or to avoid it altogether (e.g., using FFI from a pure Ruby library).

Timeline:

- 2013: kou released [ruby-gnome/native-package-installer](https://github.com/ruby-gnome/native-package-installer) to compile ruby-gnome against native libraries.
- 2020: kou's Ruby Kaigi talk ["Goodbye fat gem"](https://slide.rabbit-shocker.org/authors/kou/rubykaigi-takeout-2020/)
- 2022: postmodern's [Draft RFC on extending the gem specification](https://gist.github.com/postmodern/4c0cbccc0c7eda4585db0fc5267cdd57)
- 2025: [ruby-gnome/rubygems-requirements-system](https://github.com/ruby-gnome/rubygems-requirements-system) based in part on the draft RFC


### Trust

2021-04-16

In 2021, I [posted on Twitter asking people about their trust](https://x.com/flavorjones/status/1383061149294411780) in precompiled gems.

- 44% say YOLO
- 42% say opt-in
- 13% say never
