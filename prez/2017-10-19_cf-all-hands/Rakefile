desc "Start watching `deck.md` and update your presentation as you edit."
task :watch => :open do
  puts <<-'TEXT'
  ****************

  Starting a server to build your deck!

  1. Keep this terminal open, and
  2. `rake open` in a new terminal. Changes to `deck.md` will automatically be built, just
  3. refresh the page.

  Happy presentation-writing!

  ****************
  TEXT

  puts "Watching your presentation, updating deck/index.html"
  exec "mdpress --automatic deck.md --stylesheet pivotal"
end

desc "Build your presentation from `deck.md` with mdpress."
task :build do
  puts "Building your presentation at deck/index.html"
  `mdpress deck.md --stylesheet pivotal`
end

desc "Open up your presentation."
task :open => :build do
  sh "launchy deck/index.html"
end

task :default => [:watch]
