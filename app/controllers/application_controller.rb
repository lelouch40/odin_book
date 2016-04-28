class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,:avatar, :avatar_cache,:current_password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password,
       :avatar, :avatar_cache,:current_password) }
end
  end