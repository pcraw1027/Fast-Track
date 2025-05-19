class Api::V1::ReviewsController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:show, :get_product_reviews, :get_company_reviews]
  before_action :set_review, only: [:update, :show]
  
  def update
    if @review.update(review_params.except(:product_id, :company_id))
      render json: @review, status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def show
      render json: @review, status: :ok
  end

  def product_reviews
    review = Review.new(review_params.except(:product_id, :company_id))
    review.user_id = current_user.id
    review.reviewable_id = params[:review][:product_id]
    review.reviewable_type = "Product"
    if review.save && review.valid?
      render json: review, status: :ok
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def company_reviews
    review = Review.new(review_params.except(:product_id, :company_id))
    review.user_id = current_user.id
    review.reviewable_id = params[:review][:company_id]
    review.reviewable_type = "Company"
    if review.save && review.valid?
      render json: review, status: :ok
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def get_product_reviews
    render json: load(params[:product_id], "Product"), status: :ok
  end

  def get_company_reviews
    render json: load(params[:company_id], "Company"), status: :ok
  end


  private


  def set_review
    @review = Review.find(params[:id])
  end

  def load(reviewable_id, reviewable_type)
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    per_page = 10 if per_page.to_i > 10
    result_claims = Review.load_data(per_page, page, reviewable_id, reviewable_type)
  end

  def review_params
    params.require(:review).permit(:rating, :title, :comment, :company_id, :product_id)
  end
 
 
end
