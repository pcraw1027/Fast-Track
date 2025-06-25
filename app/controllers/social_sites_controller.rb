class SocialSitesController < ApplicationController
  before_action :set_social_site, only: %i[ show edit update destroy ]

  # GET /social_sites or /social_sites.json
  def index
    @social_sites = SocialSite.all
  end

  # GET /social_sites/1 or /social_sites/1.json
  def show
  end

  # GET /social_sites/new
  def new
    @social_site = SocialSite.new
  end

  # GET /social_sites/1/edit
  def edit
  end

  # POST /social_sites or /social_sites.json
  def create
    @social_site = SocialSite.new(social_site_params)

    respond_to do |format|
      if @social_site.save
        format.html { redirect_to @social_site, notice: "Social site was successfully created." }
        format.json { render :show, status: :created, location: @social_site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @social_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_sites/1 or /social_sites/1.json
  def update
    respond_to do |format|
      if @social_site.update(social_site_params)
        format.html { redirect_to @social_site, notice: "Social site was successfully updated." }
        format.json { render :show, status: :ok, location: @social_site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @social_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_sites/1 or /social_sites/1.json
  def destroy
    @social_site.destroy

    respond_to do |format|
      format.html { redirect_to social_sites_path, status: :see_other, notice: "Social site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_site
      @social_site = SocialSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_site_params
      params.require(:social_site).permit(:site_code, :site)
    end
end
