class Domains::People::PeopleController < ApplicationController
  before_action :set_person, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /people or /people.json
  def index
    @people = Domains::People::Person.all
                                     .paginate(page: params[:page], per_page: 15)
                                     .order(created_at: :desc, id: :desc)
  end

  # GET /people/1 or /people/1.json
  def show
    @person = Domains::People::Person.includes(:gender_type,
                              :ethnicity_type,
                              :country_reference,
                              person_social_sites: [:social_site]).find(params[:id])
  end
  
  # GET /people_search?q=...
  def search
    if params[:q].present?
      query = "%#{params[:q]}%"
      people = Domains::People::Person
               .where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", query, query, query).limit(20)
    else
      people = Domains::People::Person.none
    end
    render json: people.as_json(only: [:id, :first_name, :last_name, :middle_name, :letters, :email, 
                                       :website, :gender_type_id, :ethnicity_type_id, :country_reference_id, :picture])
  end


  # GET /people/new
  def new
    @person = Domains::People::Person.new
    @social_sites = Domains::Socials::SocialSite.all
    @gender_types = Domains::People::GenderType.all
    @ethinicity_types = Domains::People::EthnicityType.all
    @country_references = Domains::ContactAndIdentity::CountryReference.all
  end

  # GET /people/1/edit
  def edit
    @social_sites = Domains::Socials::SocialSite.all
    @gender_types = Domains::People::GenderType.all
    @ethinicity_types = Domains::People::EthnicityType.all
    @country_references = Domains::ContactAndIdentity::CountryReference.all
  end

  # POST /people or /people.json
  def create
    @person = Domains::People::Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to domains_people_people_path, status: :see_other, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private


    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Domains::People::Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:domains_people_person).permit(:title, :phone, :first_name, :middle_name, :last_name, 
      :letters, :gender_type_id, :ethnicity_type_id, :country_reference_id, :picture, 
      :email, :website, person_social_sites_attributes: [:id, :social_site_id, :profile_link, :_destroy])
    end
end
