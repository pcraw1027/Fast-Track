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
    render json: {
      recent_scans: recent_scan_products(10, 1).records,
      activity_stats: activity_stats
    }, status: :ok
  end


  def landing_metrics
    my_scan_products = Domains::CroupierCore::RawQueryModule.my_scan_products(10, 1, current_user.id)
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

  def activity_stats
    start_date = Time.current.beginning_of_month
    end_date = Time.current.end_of_month
    total_scans = Domains::CroupierCore::Scan.count
    total_scans_monthly = Domains::CroupierCore::Scan.where(created_at: start_date..end_date).count
    total_uploads = Domains::CroupierCore::UploadRecord.count
    total_uploads_monthly = Domains::CroupierCore::UploadRecord.where(created_at: start_date..end_date).count
    total_products = Domains::Products::Product.count
    total_products_monthly = Domains::Products::Product.where(created_at: start_date..end_date).count
    total_companies = Domains::Companies::Company.count
    total_companies_monthly = Domains::Companies::Company.where(created_at: start_date..end_date).count
    [
      {
        type: "scans",
        currentMonth: total_scans_monthly,
        overall: total_scans
      },
      {
        type: "uploads",
        currentMonth: total_uploads_monthly,
        overall: total_uploads
      },
      {
        type: "products",
        currentMonth: total_products_monthly,
        overall: total_products
      },
      {
        type: "companies",
        currentMonth: total_companies_monthly,
        overall: total_companies
      }
    ]
  end

  

end
