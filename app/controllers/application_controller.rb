class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :add_www_subdomain
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location, :avatar])
  end

  private

  def add_www_subdomain
    unless /^www/.match(request.host)
      redirect_to("#{request.protocol}www.#{request.host_with_port}#{request.original_fullpath}", status: 301)
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
