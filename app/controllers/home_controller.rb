class HomeController < ApplicationController
  def index
    unless current_user.active?
      sign_out(current_user)
      redirect_to new_user_session_path, notice: "Your account has been #{current_user.status}. Please contact support." and return
    end
  end

  def about
  end
end
