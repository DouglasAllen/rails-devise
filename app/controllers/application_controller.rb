class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def env_vars
    vars = request.env.each.sort
    render plain: "env #{vars.each {|v| v}}"
  end

  def protected
    methods = self.methods.each.sort
    render plain: "#{methods.each {|m| m }}"
  end

  def index
    render template: "devise/registrations/new"
  end
end
