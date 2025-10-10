class Domains::Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show destroy edit update ]
  #before_action :authorize_user

  
  # GET /users or /users.json
  def index
    @users = Domains::Users::User.all.paginate(page: params[:page], per_page: 12)
                                 .order(created_at: :desc, id: :desc)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if !current_user.admin? 
        format.html { redirect_to @user, alert: "You are not authorized!." }
        format.json { render :show, status: :ok, location: @user }
      elsif @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.update(status: 2)

    respond_to do |format|
      format.html { redirect_to domains_users_users_path, status: :see_other, notice: "user was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private


    def set_user
      @user = Domains::Users::User.find(params[:id])
    end

    def user_params
    params.require(:domains_users_user).permit(:first_name, :last_name, :role, :status, :country, :postal_code)
    end


end
