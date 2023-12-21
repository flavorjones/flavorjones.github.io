task :serve do
  sh "jekyll serve"
end

task :build do
  sh "jekyll build"
end

task :check => :build do
  require "find"

  static_dirs = ["prez"]

  static_source_files = Find.find(*static_dirs).sort
  static_target_files = Find.find(*static_dirs.map {|d| File.join("_site", d)}).map { |f| f.sub("_site/", "") }.sort

  new_files = static_target_files - static_source_files
  unless new_files.empty?
    puts "\nSurprising files found in _site:"
    new_files.each { |f| puts "  - #{f}" }
  end

  missing_files = static_source_files - static_target_files
  missing_files.reject! do |f|
    f.split(File::SEPARATOR).any? { |path_el| %w[.bundle .gitignore].include?(path_el) }
  end
  unless missing_files.empty?
    puts "\nFiles missing from _site:"
    missing_files.each { |f| puts "  - #{f}" }
  end

  if new_files.empty? && missing_files.empty?
    puts "OK"
  else
    exit 1
  end
end
