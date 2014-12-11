class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_user_time_zone

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :time_zone, :email, :password, :password_confirmation
    end
  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end
end
