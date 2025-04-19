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
    total_scans = Scan.count
    total_uploads = UploadRecord.count
    total_products = Product.count
    total_companies = Company.count
    {
      total_scans: total_scans,
      total_uploads: total_uploads,
      total_products: total_products,
      total_companies: total_companies
      }
  end

  

end
