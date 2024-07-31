require 'rack'

map "/" do
  use Rack::Static, urls: [""],
                    root: File.expand_path('./site'),
                    index: 'index.html'
  run lambda {}
end
