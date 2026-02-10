class Api::V1::AppLanding::LandingController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:landing_metrics]
  
  def live
    render json: { message: 'FastTrack is live!' }, status: :ok
  end

  def top_scans
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    render json: top_scan_products(per_page, page), status: :ok
  end

  def recent_scans
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    render json: recent_scan_products(per_page, page), status: :ok
  end

  def open_activity_stats
    activity_stats = Domains::CroupierCore::ActivityStats.current_stats
    render json: {
      recent_scans: recent_scan_products(10, 1).records,
      activity_stats: activity_stats
    }, status: :ok
  end


  def landing_metrics
    my_scan_products = Domains::CroupierCore::RawQueryModule.my_scan_products(10, 1, current_user.id)
    activity_stats = Domains::CroupierCore::ActivityStats.current_stats
    render json: {
      my_scans: my_scan_products.records,
        recent_scans: recent_scan_products(10, 1).records,
        activity_stats: activity_stats
    }, status: :ok
  end



  private 



  def top_scan_products(per_page, page)
    Domains::CroupierCore::RawQueryModule.top_scan_products(per_page, page)
  end

  def recent_scan_products(per_page, page)
    Domains::CroupierCore::RawQueryModule.recent_scan_products(per_page, page)
  end
  

end
