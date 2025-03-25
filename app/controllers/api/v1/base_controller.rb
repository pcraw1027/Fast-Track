class Api::V1::BaseController < ApplicationController
  # responds_to :json
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  
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
    render json: { error: exception.message}, status: :internal_server_error 
  end



  protected



  def render_error(message, status = :unprocessable_entity)
    render json: { error: message }, status: status
  end

  def render_not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

end