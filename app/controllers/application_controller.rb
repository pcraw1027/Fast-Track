class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery unless: -> { request.format.json? }
  before_action :verify_authenticity_token, unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username country postal_code invite_code])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username country postal_code])
  end

  

  private


  def user_not_authorized
    if request.format.json?
      render json: { error: "You are not authorized to perform this action." }, status: :forbidden
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end

end
