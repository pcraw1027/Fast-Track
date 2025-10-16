class Domains::Socials::PersonSocialSitesController < ApplicationController
  before_action :set_person_social_site, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /person_social_sites or /person_social_sites.json
  def index
    @person_social_sites = Domains::Socials::PersonSocialSite.includes(:social_site, :person).all
  end

  # GET /person_social_sites/1 or /person_social_sites/1.json
  def show
    @person_social_site = Domains::Socials::PersonSocialSite.includes(:social_site, :person).find(params[:id])
  end

  # GET /person_social_sites/new
  def new
    @person_social_site = Domains::Socials::PersonSocialSite.new
  end

  # GET /person_social_sites/1/edit
  def edit
  end

  # POST /person_social_sites or /person_social_sites.json
  def create
    @person_social_site = Domains::Socials::PersonSocialSite.new(person_social_site_params)

    respond_to do |format|
      if @person_social_site.save
        format.html { redirect_to @person_social_site, notice: "Person social site was successfully created." }
        format.json { render :show, status: :created, location: @person_social_site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_social_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_social_sites/1 or /person_social_sites/1.json
  def update
    respond_to do |format|
      if @person_social_site.update(person_social_site_params)
        format.html { redirect_to @person_social_site, notice: "Person social site was successfully updated." }
        format.json { render :show, status: :ok, location: @person_social_site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_social_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_social_sites/1 or /person_social_sites/1.json
  def destroy
    @person_social_site.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_socials_person_social_sites_path, status: :see_other, notice: "Person social site was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_social_site
      @person_social_site = Domains::Socials::PersonSocialSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_social_site_params
      params.require(:domains_socials_person_social_site).permit(:person_id, :social_site_id, :profile_link)
    end
end
