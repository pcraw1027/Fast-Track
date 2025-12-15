class Domains::Users::InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /invitations or /invitations.json
  def index
    @invitations = Domains::Users::Invitation.includes(:invited_by)
                                             .all.paginate(page: params[:page], per_page: 15).order(
                                               created_at: :desc, id: :desc
                                             )
  end

  # GET /invitations/1 or /invitations/1.json
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Domains::Users::Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations or /invitations.json
  def create
    @invitation = Domains::Users::Invitation.new(invitation_params)
    @invitation.email = invitation_params[:email].downcase if invitation_params[:email]
    @invitation.invited_by_id = current_user.id
    @invitation.status = 0
    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, notice: "Invitation was successfully created." }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invitations/1 or /invitations/1.json
  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to @invitation, notice: "Invitation was successfully updated." }
        format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1 or /invitations/1.json
  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to domains_users_invitations_path, status: :see_other, notice: "Invitation was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private


    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Domains::Users::Invitation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.require(:domains_users_invitation).permit(:email, :first_name, :last_name, :invited_by_id, :invite_code, :status)
    end
end
