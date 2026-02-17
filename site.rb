require "date"
require "time"
require "yaml"

#
#  site configuration and building blocks
#
class Site
  def config
    @config ||= YAML.load_file("config.yml", symbolize_names: true)
  end

  def directory = config.fetch(:directory).delete_suffix("/")

  def navigation = config.fetch(:navigation)

  def title = config.fetch(:title)

  def artifacts = config.fetch(:artifacts)

  def tailwind = config.fetch(:tailwind)

  def css = config.fetch(:css)

  def layout = config.fetch(:layout)

  def redirects = config.fetch(:redirects)

  def rss_entries
    entries = []

    # Posts from posts/**/*.md
    Dir.glob("posts/**/*.md").each do |path|
      front_matter, _ = parse_front_matter(File.read(path))

      date = front_matter[:date]
      raise "Missing date for #{path}" unless date

      entries << {
        title: front_matter[:title],
        description: front_matter[:short]&.strip,
        date: date,
        url: path.sub(/\.md$/, ".html"),
      }
    end

    # Media entries from media.rhtml front matter
    media_front_matter, _ = parse_front_matter(File.read("media.rhtml"))
    [:video, :audio, :presentations].each do |section|
      media_front_matter.fetch(section, []).each do |entry|
        date = entry[:date]
        raise "Missing date for media entry: #{entry[:title]}" unless date

        entries << {
          title: entry[:title],
          description: entry[:desc]&.strip,
          date: date,
          url: entry[:url],
        }
      end
    end

    entries.sort_by { |e| e[:date] }.reverse
  end

  def files
    filenames = config.fetch(:navigation).map { _1[:file] } + config.fetch(:files)
    filenames.compact.map { File.join(directory, _1) }
  end

  def parse_front_matter(raw_content)
    # remove leading comments
    if raw_content[0..1000].lines.include?("---\n")
      sections = raw_content.split("---\n", 3)
      [YAML.load(sections[1], symbolize_names: true, permitted_classes: [Date]), sections[2]]
    else
      [{}, raw_content]
    end
  end

  def process_template(source, destination, **render_context)
    puts "#{source} => #{destination} #{render_context.empty? ? "" : render_context}"

    front_matter, content = parse_front_matter(File.read(source))
    front_matter[:file] ||= Pathname.new(destination).relative_path_from(directory).to_s

    file_basename, *file_extensions = source.split(".")

    file_extensions.reverse.each do |file_ext|
      next unless tilt_config.key?(".#{file_ext}")
      fake_filename = "#{file_basename}.#{file_ext}"
      tilt_template = Tilt.new(fake_filename, nil, tilt_config.fetch(".#{file_ext}")) { content }
      content = tilt_template.render(self, **render_context.merge(site: self, page: front_matter))
    end

    unless front_matter[:no_layout]
      tilt_template = Tilt.new(layout, nil, tilt_config[File.extname(layout)])
      content = tilt_template.render(self, **render_context.merge(site: self, content: content, page: front_matter))
    end

    File.write(destination, content)
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
      ".erb" => { trim: "<>-" },
    }
  end
end
