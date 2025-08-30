class ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: %i[ edit update destroy ]

  # GET /product_variants/1/edit
  def edit
    @product = @product_variant.product
    unless @product_variant.media.any?
      image_path = Rails.root.join("lib/seeds/prod_images/011111396487.jpg")
      if File.exist?(image_path)
                @product_variant.media.create!(
                file: File.open(image_path),
                media_type: :image,
                position: 0
            )
      end
    end
  end
  
  
  # PATCH/PUT /product_variants/1 or /product_variants/1.json
  def update
    respond_to do |format|
      if @product_variant.update(product_variant_params)
        format.html { redirect_to @product_variant.product, notice: "product variant was successfully updated." }
        format.json { render :show, status: :ok, location: @product_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_variants/1 or /product_variants/1.json
  def destroy
    @product = @product_variant.product
    @product_variant.destroy

    respond_to do |format|
      format.html { redirect_to @product, status: :see_other, notice: "product variant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_media
    medium = Medium.find(params[:medium_id])
    @product = medium.mediaable.product
    medium.destroy

    respond_to do |format|
      format.html { redirect_to @product, status: :see_other, notice: "product image was successfully deleted." }
      format.json { head :no_content }
    end
  end

  
  private


    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end


    def product_variant_params
      params.require(:product_variant).permit(:barcode, media_attributes: [:id, :file, :_destroy])
    end
end
