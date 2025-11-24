class Api::V1::BaseController < ApplicationController
  # responds_to :json
  skip_before_action :verify_authenticity_token
  #protect_from_forgery with: :null_session
  

  rescue_from ActiveRecord::Rollback, with: :record_rollback
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from StandardError, with: :server_error
  rescue_from LimitOfRepliesReached,with: :limit_reached
  rescue_from ResourceUnavailableError do |exception|
    render json: { error: exception.message }, status: :forbidden
  end

  def record_rollback(exception)
    render json: { error: exception.message }, status: :bad_request
  end

  def record_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def record_invalid(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def limit_reached(exception)
    render json: { error: exception.message}, status: :internal_server_error
  end

  def server_error(exception)
    #render json: { error: "Internal server error" }, status: :internal_server_error
    if exception.message.include?("Couldn't find") && exception.message.include?("'id'=")
       render json: { error: exception.message }, status: :not_found
     else
       render json: { error: exception.message}, status: :internal_server_error
    end
  end


  def authenticate_user!
    token = request.headers['Authorization']&.split&.last 
    
    if token.blank?
      render json: { error: 'Authorization token not provided' }, status: :unauthorized
    else
      begin
        # Decode the token
        payload = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key, true, { algorithm: 'HS256' })
        user_id = payload[0]['sub']
  
        # Check if the token is in the AllowlistedJwt table
        allowlisted_token = Domains::Users::AllowlistedJwt.find_by(jti: payload[0]['jti'], user_id: user_id)
  
        if allowlisted_token.nil?
          render json: { error: 'Authorization token has been revoked or does not exist' }, status: :unauthorized
        else
          @current_user = Domains::Users::User.find(user_id)
        end
      rescue JWT::DecodeError
        render json: { error: 'Invalid authorization token' }, status: :unauthorized
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :unauthorized
      end
    end
  end

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
  end

  def current_user
    @current_user
  end


  protected



  def render_error(message, status = :unprocessable_entity)
    render json: { error: message }, status: status
  end

  def render_not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

end