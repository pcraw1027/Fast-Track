class PublicBaseController < ApplicationController

  before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  

end