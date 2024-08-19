require "rack"
require "rack/rewrite"

use Rack::Rewrite do
  moved_permanently "/about.html", "/"
  moved_permanently "/prez.html", "/media.html"
  moved_permanently "/Michael-Dalessio.html", "/resume.html"
end

map "/" do
  use Rack::Static, urls: [""],
                    root: File.expand_path("./site"),
                    index: "index.html"
  run lambda {}
end
