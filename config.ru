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

# https://github.com/DouglasAllen/sprockets
map '/assets' do
  environment = Sprockets::Environment.new
  environment.context_class.class_eval do
    def asset_path(path, options = {})
      "assets/#{path}"
    end
  end
 
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  run environment
end


map '/config' do
  run lambda {|env| Rack::Source.new('./config.ru').call(env)}
end

map '/env' do  
  run lambda {|env| [200,{"Content-Type" => "text/html"}, env.sort.map {|k, v| "#{k}=>#{v}</br>"}]}
end

map '/' do
  #Rails.application.assets
  run Rails.application
end
	
