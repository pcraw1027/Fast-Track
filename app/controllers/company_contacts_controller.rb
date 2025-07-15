class CompanyContactsController < ApplicationController
  before_action :set_company_contact, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create]

  # GET /company_contacts or /company_contacts.json
  def index
    @company_contacts = CompanyContact.all.paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
  end

  # GET /company_contacts/1 or /company_contacts/1.json
  def show
  end

  # GET /company_contacts/new
  def new
    @company_contact = CompanyContact.new
  end

  # GET /company_contacts/1/edit
  def edit
  end

  # POST /company_contacts or /company_contacts.json
  def create
    @company_contact = CompanyContact.new(company_contact_params)

    respond_to do |format|
      if @company_contact.save
        format.html { redirect_to @company_contact, notice: "Company contact was successfully created." }
        format.json { render :show, status: :created, location: @company_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_contacts/1 or /company_contacts/1.json
  def update
    respond_to do |format|
      if @company_contact.update(company_contact_params)
        format.html { redirect_to @company_contact, notice: "Company contact was successfully updated." }
        format.json { render :show, status: :ok, location: @company_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_contacts/1 or /company_contacts/1.json
  def destroy
    @company_contact.destroy

    respond_to do |format|
      format.html { redirect_to company_contacts_path, status: :see_other, notice: "Company contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_contact
      @company_contact = CompanyContact.find(params[:id])
    end

    def set_dropdowns
      @companies = Company.all
      @company_contact_types = CompanyContactType.all
    end

    # Only allow a list of trusted parameters through.
    def company_contact_params
      params.require(:company_contact).permit(:company_id, :company_contact_type_id, :name, :job_title, :email, :phone, :photo)
    end
end
