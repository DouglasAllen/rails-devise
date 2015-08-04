# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
map '/public' do
  use Rack::Static,
    :urls => ["/assets"],
    :root => "public"	
    # This is the root of our app
  @root = File.expand_path('../public', __FILE__)
  run lambda {|env| Rack::Directory.new(@root).call(env)} 
end

map '/' do
  run Rails.application
end