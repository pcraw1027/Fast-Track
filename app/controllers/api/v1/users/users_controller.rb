class Api::V1::Users::UsersController < Api::V1::BaseController
  before_action :authenticate_user!

  def update
    user = current_user
    filtered_params = user_params.compact_blank

    if user.update(filtered_params)
        render json: { user_profile: Domains::Users::V1::UserSerializer.new(user).serializable_hash[:data][:attributes] }, 
status: :ok
    else
        render json: { error: user.errors }, status: :unprocessable_entity 
    end
  end

  def get_user_default_list
     list = Domains::Users::ListRoutine.new(user_id: current_user.id).default_list
    render json: list, status: :ok
  end

  def turn_on_scan_to_list_mode
    current_user.update(scan_to_list_mode: true)
    render json: { user: current_user, message: "successfully turned on scan to list mode" }, status: :ok
  end

  def turn_off_scan_to_list_mode
    current_user.update(scan_to_list_mode: false)
    render json: { user: current_user, message: "successfully turned off scan to list mode" }, status: :ok
  end
  

  private


  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :app_notify_on, 
                                  :email_notify_on, :country, :postal_code, :scan_to_list_mode)
  end


end