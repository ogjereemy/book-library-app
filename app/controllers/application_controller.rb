class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_invalid_authenticity_token

  protected

  def configure_permitted_parameters
    # Permit the `name` parameter along with the default ones
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def handle_invalid_authenticity_token
    # Log the error for debugging purposes
    logger.error "Invalid authenticity token detected"
    # Redirect to the login page with an alert
    redirect_to new_user_session_path, alert: "Your session has expired. Please log in again."
  end
end
