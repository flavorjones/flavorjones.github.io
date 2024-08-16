require "bundler/setup"

require "yaml"
require "rake/clean"

#
#  site configuration and building blocks
#
class Site
  def config
    @config ||= YAML.load_file("config.yml", symbolize_names: true)
  end

  def directory
    config.fetch(:directory).delete_suffix("/")
  end

  def navigation
    config.fetch(:navigation)
  end

  def title
    config.fetch(:title)
  end

  def artifacts
    config.fetch(:artifacts)
  end

  def tailwind
    config.fetch(:tailwind)
  end

  def css
    config.fetch(:css)
  end

  def files
    filenames = config.fetch(:navigation).map { _1[:file] } + config.fetch(:files)
    filenames.compact.map { File.join(directory, _1) }
  end

  def layout
    config.fetch(:layout)
  end

  def parse_front_matter(raw_content)
    if raw_content.start_with?("---\n")
      sections = raw_content.split("---\n", 3)
      [YAML.load(sections[1], symbolize_names: true), sections[2]]
    else
      [{}, raw_content]
    end
  end

  def process_template(source, destination)
    puts "#{source} => #{destination}"

    front_matter, content = parse_front_matter(File.read(source))
    front_matter[:file] ||= Pathname.new(destination).relative_path_from(directory).to_s

    tilt_template = Tilt.new(source, nil, tilt_config[File.extname(source)]) { content }
    content = tilt_template.render(self, { site: self, page: front_matter })

    tilt_template = Tilt.new(layout, nil, tilt_config[File.extname(layout)])
    page = tilt_template.render(self, { site: self, content: content, page: front_matter })

    File.write(destination, page)
  end

  def tilt_config
    {
      ".md" => {
        input: "GFM",
        hard_wrap: false,
        syntax_highlighter: "rouge",
        syntax_highlighter_opts: { css_class: "no-prose" },
      },
      ".haml" => {},
      ".rhtml" => { trim: "<>-" },
    }
  end
end
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
end


#
#  site tasks
#
directory site.directory
CLEAN << site.directory

desc "Build the site"
task build: [:artifacts, :templates, :tailwind]

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
