
class Api::V1::PasswordsController < Api::V1::BaseController 

  before_action :authenticate_user!, only: [:update_password]

  def update_password
    user = current_user
    unless user&.valid_password?(params[:current_password])
      render json: { error: 'Current password is incorrect!' }, 
status: :unauthorized and return
    end
     
    if user.update(password: params[:new_password])
      render json: { message: 'Password updated successfully.' }, status: :ok
    else
      render json: { error: user.errors }, status: :unprocessable_entity
    end
  end

  def send_password_reset_instruction
    resource = User.find_by(email: params[:email])
    if resource.present?
      Rails.logger.info "#{resource.inspect}"
       token = resource.generate_password_token!
       UserMailer.reset_password_email(resource, token).deliver_later
       render json: { message: "password reset instructions sent" }, status: :ok
    else
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end
  
  def reset_password
    if params[:token].blank?
       render json: {error: 'Token not present'}, status: :bad_request and return
    end
    token = params[:token].to_s
    user = User.find_by(reset_password_token: token.downcase)
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: {message: "password has been reset successfully"}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: 'Link not valid or expired. Try generating a new link.'}, status: :not_found
    end
  
  end
  
  



end



