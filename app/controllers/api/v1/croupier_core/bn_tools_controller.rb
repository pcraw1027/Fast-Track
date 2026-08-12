class Api::V1::CroupierCore::BnToolsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :validate_request_user
  before_action :validate_lat_lng, only: :nearby_addresses 
  before_action :require_address_param, only: :activity_stats


  def activity_stats
    stats_data =  Domains::CroupierCore::BnActivityStats
                    .compute_stats(address_id: params[:address_id], user_id: current_user.id)
    render json: stats_data, status: :ok
  end

  def nearby_addresses
    page = params[:page] || 1
    per_page = params[:per_page] || 5
    per_page = 20 if per_page.to_i > 20
    nearest_locations = Domains::ContactAndIdentity::Address.closest_to( 
                                    lat: @lat, 
                                    lng: @lng, 
                                    page: page, 
                                    per_page: 5
                                )
    render json: nearest_locations, status: :ok
  end

 

  private


  def require_address_param
    return if params[:address_id].present?

    render json: { error: 'address_id parameter is required' }, status: :bad_request
  end


  def validate_lat_lng
    @lat = Float(params[:lat])
    @lng = Float(params[:lng])

    unless @lat.between?(-90.0, 90.0) && @lng.between?(-180.0, 180.0)
        render json: { error: 'Latitude must be between -90 and 90, Longitude between -180 and 180' }, status: :unprocessable_entity
    end
    rescue ArgumentError, TypeError
    render json: { error: 'Invalid or missing Lat or Lng' }, status: :bad_request
  end

  
  def validate_request_user
    unless current_user.barcode_ninja? || current_user.barcode_ninja_manager?
      render json: { error: 'You must be a barcode ninja or a barcode ninja manager' }, status: :unauthorized
    end
  end


end