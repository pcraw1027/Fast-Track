class Api::V1::RegistrationsController < Api::V1::BaseController

  # Create action for user registration
  def create
    user = User.new(user_params.except(:invite_code, :username))
    user.username = user_params[:username].downcase if user_params[:username]
    if user.save
      invitation = Invitation.find_by(invite_code: user_params[:invite_code])
      invitation.update(username: user_params[:username].downcase, country: user_params[:country], 
      postal_code: user_params[:postal_code], status: 1) if invitation
      respond_with(user)
    else
      respond_with(user)
    end
  end

  def verify_invite_code
    invitation = Invitation.find_by(invite_code: params[:invite_code])
    if invitation
      render json: invitation, status: :ok
    else
      render json: {
        message: "Invalid invitation code #{params[:invite_code]}!"
      }, status: :unauthorized
    end
  end

  def verify_username
    user = User.find_by(username: params[:username].downcase) if params[:username]
    if user
      render json: {
        message: "username is already taken"
      }, status: :unauthorized
    else
      render json: { message:"username is available" }, status: :ok
    end
  end


  private


  def user_params
    params.require(:user).permit(:email, :invite_code, :password, :password_confirmation, :username, :country, 
:postal_code)
  end
  

  def respond_with(resource)
    if resource.persisted?
      token = AuthJwtStrategy.new(resource).authenticate_user()
      render json: {
        message: 'Signed up successfully.',
        user: Api::V1::UserSerializer.new(resource).serializable_hash[:data][:attributes],
        token: token
      }, status: :created
    else
      render json: {
        message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"
      }, status: :unprocessable_entity
    end
  end
end