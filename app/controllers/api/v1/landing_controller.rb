class Api::V1::LandingController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:landing_metrics]
  
  def live
    render json: { message: 'FastTrack is live!' }, status: 200
  end

  
  def landing_metrics
    my_top_scan_products = RawQueryModule.my_top_scan_products(3, current_user.id)
    top_scan_products = RawQueryModule.top_scan_products(3)
    render json: {
      my_scans: my_top_scan_products,
      top_scans: top_scan_products,
      activity_stats: activity_stats
      }, status: :ok
  end


  private 
  
  
  def activity_stats
    start_date = Time.current.beginning_of_month
    end_date = Time.current.end_of_month
    total_scans = Scan.count
    total_scans_monthly = Scan.where(created_at: start_date..end_date).count
    total_uploads = UploadRecord.count
    total_uploads_monthly = UploadRecord.where(created_at: start_date..end_date).count
    total_products = Product.count
    total_products_monthly = Product.where(created_at: start_date..end_date).count
    total_companies = Company.count
    total_companies_monthly = Company.where(created_at: start_date..end_date).count
    [
      {
        type:"scans",
        currentMonth: total_scans_monthly,
        overall: total_scans
      },
      {
        type:"uploads",
        currentMonth: total_uploads_monthly,
        overall: total_uploads
      },
      {
        type:"products",
        currentMonth: total_products_monthly,
        overall: total_products
      },
      {
        type:"companies",
        currentMonth: total_companies_monthly,
        overall: total_companies
      }
    ]
  end

  

end
