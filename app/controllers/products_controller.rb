class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy insert_product update_to_level_two]

  # GET /products or /products.json
  def index
    @products = if params[:q].present?
                  products_query.where("name ILIKE ?", "%#{params[:q]}%")
                else
                  products_query.all
                end
    @products = @products.paginate(page: params[:page], per_page: 12)
                         .order(created_at: :desc, id: :desc)
  end

  

  def insert_product
    error = validate_product_params
    barcode = product_variant_params[:barcode]&.strip
    company_name = params[:product][:new_company_name]

    if error.present?
      respond_to_invalid_entries(error, product_capture_interface_path(barcode: barcode))
      return
    end

    mid = CroupierCore::MidExtractor.call!(barcode: barcode).payload
    company, cit_rec = resolve_company_and_cit_record(mid, company_name)

    unless company
      respond_to_invalid_entries("Company not found", product_capture_interface_path(barcode: barcode))
      return
    end

    update_cit_record_company(cit_rec, company, mid)

    pit_record = PitRecord.find_by(barcode: barcode)
    variant_exist = ProductVariant.includes(:product).find_by(barcode: barcode)

    if variant_exist
      update_existing_product_and_variant(variant_exist, company.id, pit_record, barcode)
      return
    end

    create_new_product_and_variant(company.id, pit_record, barcode)
  end

  def update_to_level_two
    @product = Product.find(params[:product_id])
    barcode = product_variant_params[:barcode]&.strip
    respond_to do |format|
      if @product.update!(product_params)
        CroupierCore::UpgradePitLevel.call!(barcode: barcode, 
          product_id: @product.id, asin: nil, user_id: current_user.id, level: 2)
        format.html { redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        error = @product.errors.map { |er| "#{er.attribute} #{er.message}" }.join(", ")
        format.html { redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), alert: error }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @variants = @product.product_variants.includes(:media)
  end

  # GET /products/new
  def new
    @product = Product.new
    product_variant = ProductVariant.new
    product_variant.media.build
    @product.media = product_variant.media
  end

  # GET /products/1/edit
  def edit
    variant = ProductVariant.find_by(product_id: params[:id])
    if variant
      redirect_to(product_capture_interface_path(barcode: variant.barcode, level: 0))
    else
      redirect_to(products_path, alert: "product has no variant! Simply delete this product and create a new one")
    end
  end

  # POST /products or /products.json
  def create
    if product_variant_params[:barcode]&.strip.length < 12
      respond_to_invalid_entries("minimum barcode length is 12")
      return
    end

    variant_exist = ProductVariant.find_by(barcode: product_variant_params[:barcode]&.strip)
    if variant_exist
      respond_to_invalid_entries("Product variant already exist.")
      return
    end

    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        pv = ProductVariant.new(product_variant_params)
        pv.barcode = pv.barcode.strip
        pv.product_id = @product.id
        pv.save!
        format.html { redirect_to @product, notice: "Product successfully created" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def products_query
      Product.includes(:company, :segment, :family, :klass, :brick, :product_variants)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_dropdowns
      @product_category_sources = ProductCategorySource.all
      product_category_source_id = @product_category_sources&.find { |p| p.code == 'AMZ' }&.id
      @segments = Segment.where(product_category_source_id: product_category_source_id)
    end

    def upgrade_pit_to_level_1(product_id, pit_level, company_id)
      if pit_level == 0
        CroupierCore::UpgradePitLevel.call!(
          barcode: product_variant_params[:barcode].strip,
          product_id: product_id,
          asin: params[:product][:asin],
          user_id: current_user.id,
          company_id: company_id,
          level: 1
        )
      end
    end

    def respond_to_invalid_entries(msg, path = new_product_path)
      respond_to do |format|
        format.html { redirect_to path, alert: msg }
        format.json { render json: { errors: [{ barcode: msg }] }, status: :unprocessable_entity }
      end
    end

    def validate_product_params
      error = ""
      error += "product name is required, " if product_params[:name].blank?
      error += "description is required" if product_params[:description].blank?
      error
    end

    def resolve_company_and_cit_record(mid, company_name)
      company = nil
      cit_rec = CitRecord.find_by(mid: mid)

      if product_params[:company_id]&.to_s.match?(/^\d+$/)
        company = Company.find_by(id: product_params[:company_id])
      else
        begin
          if cit_rec
            old_company = cit_rec.company
            if old_company && old_company.name != company_name
              sys_gen_mid = CitRecord.generate_mid(old_company.id)
              CitRecordHandler.update_or_create(nil, mid: sys_gen_mid, source: "Product Import",
                                                user_id: current_user.id, company_id: old_company.id, brand: nil)
              old_company.update(mids: [sys_gen_mid])
            end
          end
          company = Company.create!(name: company_name, mids: [mid])
        rescue => e
          puts e.message
          redirect_to(product_capture_interface_path(barcode: product_variant_params[:barcode]&.strip), alert: e.message)
          return [nil, nil]
        end
      end
      [company, cit_rec]
    end

    def update_cit_record_company(cit_rec, company, mid)
      if company && cit_rec
        cit_rec.update(company_id: company.id) if cit_rec.company_id != company.id
      elsif company
        sys_gen_mid = CitRecord.generate_mid(company.id)
        cit_rec = CitRecord.find_by(mid: sys_gen_mid)
        if cit_rec
          cit_rec.update(mid: mid, company_id: company.id)
          company.update(mids: [mid])
        else
          CitRecordHandler.update_or_create(nil, mid: mid, source: "Product Import",
                                            user_id: current_user.id, company_id: company.id, brand: nil)
        end
      end
    end

    def update_existing_product_and_variant(variant_exist, company_id, pit_record, barcode)
      @product = variant_exist.product
      variant_exist.update(product_variant_params) unless product_variant_params.blank?
      if @product.update(product_params.merge(company_id: company_id))
        upgrade_pit_to_level_1(@product.id, pit_record&.level, company_id)
        redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), notice: "Product was successfully updated."
        return
      end
    end

    def create_new_product_and_variant(company_id, pit_record, barcode)
      @product = Product.new(product_params.merge(company_id: company_id))
      respond_to do |format|
        if @product.save
          pv = ProductVariant.new(product_variant_params)
          pv.barcode = pv.barcode.strip
          pv.product_id = @product.id
          pv.save!
          upgrade_pit_to_level_1(@product.id, pit_record&.level, company_id)
          Scan.resolve(barcode, @product.id)
          UploadRecord.resolve(barcode)
          format.html { redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), notice: "Product successfully added" }
          format.json { render :show, status: :created, location: @product }
        else
          error = @product.errors.map { |er| "#{er.attribute} #{er.message}" }.join(", ")
          format.html { redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), alert: error }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:company_id, :name, :product_category_source_id, :description,
        :qrcode, :size, :segment_id, :captured_product_category, :family_id, :klass_id, :brick_id)
    end

    def product_variant_params
      params.require(:product).permit(:barcode, media_attributes: [:id, :file, :_destroy])
    end
end
