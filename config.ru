require "rack"
require "rack/rewrite"

require_relative "site"
site = Site.new

map "/" do
  use Rack::Static, urls: [""],
                    root: File.expand_path("./site"),
                    index: "index.html"
  run lambda {}
end
