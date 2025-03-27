class Api::V1::RegistrationsController < Api::V1::BaseController

  # Create action for user registration
  def create
    user = User.new(user_params)

    if user.save
      respond_with(user)
    else
      respond_with(user)
    end
  end

  private


  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :country, :postal_code)
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