class Domains::Users::ListsController < ApplicationController
  before_action :authenticate_user!, only: %i[ create edit update destroy ]
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = Domains::Users::List.includes(:user)
                                  .all.paginate(page: params[:page], per_page: 15)
                                  .order(created_at: :desc, id: :desc)
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = Domains::Users::List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = Domains::Users::List.new(list_params)
    @list.user_id = current_user.id
    respond_to do |format|
      if Domains::Users::ListRoutine.new(user_id: current_user.id, 
                            name: list_params[:name]).list_exist?(list_name)
        format.html { render :new, status: :unprocessable_entity, alert: Domains::Users::List.name_inuse_err_msg(list_params[:name]) }
        format.json { render json:  { errors: [{ name: Domains::Users::List.name_inuse_err_msg(list_params[:name]) }] }, status: :unprocessable_entity }
      elsif @list.save
        format.html { redirect_to @list, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params.except(:default, :snapshot_aggregate))
        format.html { redirect_to @list, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_path, status: :see_other, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = Domains::Users::List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:domains_users_list).permit(:name, :list_type, :default, :description, :snapshot_aggregate)
    end
end
