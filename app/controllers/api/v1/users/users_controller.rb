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

  def update_notification_settings
    permitted = notification_settings_params.to_h

    merged_settings = current_user.notification_settings.deep_merge(permitted)

    if current_user.update(notification_settings: merged_settings)
      render json: {
        success: true,
        notification_settings: current_user.notification_settings
      }
    else
      render json: {
        success: false,
        errors: current_user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  

  private


  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :app_notify_on, :device_token,
                                  :email_notify_on, :country, :postal_code, :scan_to_list_mode)
  end

   def notification_settings_params
        params.require(:notification_settings).permit(
          :allow_notifications,
          :allow_push,
          :allow_email,
          frequency: [
            :croupier_recommended,
            :individual,
            :weekly
          ],
          notification_types: [
            :scanned_available_product,
            :new_alternative_product,
            :snapshot_update,
            :useful_ratings_reviews
          ]
        )
  end


end