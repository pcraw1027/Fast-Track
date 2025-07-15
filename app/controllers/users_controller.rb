class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show destroy ]
  #before_action :authorize_user

  
  # GET /users or /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
  end

  # GET /users/1 or /users/1.json
  def show
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end


end
