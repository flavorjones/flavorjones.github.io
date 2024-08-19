require "bundler/setup"

require "rake/clean"

require_relative "site"
site = Site.new

#
#  configure Tilt
#
require "tilt"
require "tilt/kramdown"
require "tilt/haml"

Tilt.prefer Tilt::KramdownTemplate

site.tilt_config.each do |ext, _|
  rule(".html" => [
         -> name { Pathname.new(name).sub_ext(ext).relative_path_from(site.directory).to_s },
         site.layout, "config.yml",
       ]) do |t|
    site.process_template(t.source, t.name) unless (t.name == site.layout)
  end
  rule(".html" => [
         -> name { Pathname.new(name).sub_ext("#{ext}.erb").relative_path_from(site.directory).to_s },
         site.layout, "config.yml",
       ]) do |t|
    site.process_template(t.source, t.name) unless (t.name == site.layout)
  end unless ext == ".erb"
end

#
#  site tasks
#
directory site.directory
CLEAN << site.directory

desc "Build the site"
task build: [:artifacts, :templates, :redirects, :tailwind]

# artifacts are blitted to the site directory
multitask artifacts: site.directory
site.artifacts.each do |dir|
  multitask :artifacts do
    sh "rsync", "-quiet", "--archive", "--delete", "--info=del,name1", dir, site.directory
  end
end

# templates use the rules defined above
multitask templates: site.directory
multitask templates: site.files

site.redirects.map do |redirect|
  multitask :redirects do
    target = File.join(site.directory, redirect[:from])
    site.process_template("redirect.rhtml", target, redirect:)
  end
end

# process the tailwind css file last (it depends on the html in the site directory)
tailwind_css = File.join(site.directory, site.tailwind)
file tailwind_css => [site.tailwind, site.files].flatten do |t|
  sh "tailwindcss", "build", "--minify", "-i", t.source, "-o", t.name
  FileUtils.touch(t.name) # because tailwind won't update the file timestamp if nothing changed
end
task tailwind: tailwind_css

desc "Serve the site via puma"
task serve: :build do
  sh "puma"
end

task :default => :build
