
class Api::V1::PasswordsController < Api::V1::BaseController 

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
       render json: {error: 'Token not present'}, status: 400 and return
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



