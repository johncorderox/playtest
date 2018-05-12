class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :gender])
  end

  def after_sign_up_path_for(resource)
    '/applications/<%= current_user.id %>'
  end

  def redirect_to_associated_playtest
  end

  end

end
