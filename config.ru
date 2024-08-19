require "rack"
require "rack/rewrite"

require_relative "site"
site = Site.new

use Rack::Rewrite do
  site.redirects.each do |redirect|
    puts "Redirecting #{redirect[:from]} => #{redirect[:to]}"
    moved_permanently redirect[:from], redirect[:to]
  end
end

map "/" do
  use Rack::Static, urls: [""],
                    root: File.expand_path("./site"),
                    index: "index.html"
  run lambda {}
end
