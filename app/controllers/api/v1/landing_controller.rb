class Api::V1::LandingController < Api::V1::BaseController
  
  
  def live
    render json: { message: 'FastTrack is live!' }, status: 200
  end

end