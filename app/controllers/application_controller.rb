class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :primary, :success, :info, :warning, :danger

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end
end
