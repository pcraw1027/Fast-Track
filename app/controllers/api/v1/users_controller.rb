class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!


  def update
    user = current_user
    filtered_params = user_params.compact_blank

    if user.update(filtered_params)
        render json: { user_profile: Api::V1::UserSerializer.new(user).serializable_hash[:data][:attributes] }, 
status: :ok
      else
        render json: { error: user.errors }, status: :unprocessable_entity 
      end
  end
  

  private


  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :app_notify_on, 
                                  :email_notify_on, :country, :postal_code)
  end


end