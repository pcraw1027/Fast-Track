class HomeController < ApplicationController
  def index
    if current_user && !current_user.active?
      user_status = current_user.status
      sign_out(current_user)
      redirect_to new_user_session_path, 
alert: "Your account has been #{user_status}. Please contact support." and return
    end
  end

  def about
  end
end
