class Api::V1::Features::Reviewable::ReviewsController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:show, :read_product_reviews, :read_company_reviews]
  before_action :set_review, only: [:update, :show]
  
  def show
      render json: @review, status: :ok
  end

  def update
    if @review.update(review_params.except(:product_id, :company_id))
      render json: @review, status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end


  def product_reviews
    create_reviews("Domains::Products::Product")
  end

  def company_reviews
    create_reviews("Domains::Companies::Company")
  end
  

  def read_product_reviews
    render json: load(params[:product_id], "Domains::Products::Product"), status: :ok
  end

  def read_company_reviews
    render json: load(params[:company_id], "Company"), status: :ok
  end

  def user_product_review
    render json: load_user_review(params[:product_id], "Domains::Products::Product"), status: :ok
  end

  def user_company_review
    render json: load_user_review(params[:company_id], "Domains::Companies::Company"), status: :ok
  end



  private


  def set_review
    @review = Domains::Features::Reviewable::Review.find(params[:id])
  end

  def load_user_review(reviewable_id, reviewable_type)
    Domains::Features::Reviewable::Review.find_by(reviewable_id: reviewable_id, 
                    reviewable_type: reviewable_type, user_id: current_user.id)
  end


  def create_reviews(reviewable_type)
    attribute_key = ""
    error_msg = ""
    if review_params[:title].blank? && review_params[:comment].present?
      error_msg = "review title is required"
      attribute_key = "title"
    elsif review_params[:title].present? && review_params[:comment].blank?
      error_msg = "review comment is required"
      attribute_key = "comment"
    end

    render json: { attribute_key => [error_msg] }, status: :unprocessable_entity and return if attribute_key.length.positive?

    review = Domains::Features::Reviewable::Review.new(review_params.except(:product_id, :company_id))
    review.user_id = current_user.id
    reviewable_id = reviewable_type == "Company" ? params[:review][:company_id] : params[:review][:product_id]
    review.reviewable_id = reviewable_id
    review.reviewable_type = reviewable_type
    if review.save && review.valid?
      render json: review, status: :ok
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  def load(reviewable_id, reviewable_type)
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    per_page = 10 if per_page.to_i > 10
    Domains::Features::Reviewable::Review.load_data(per_page, page, reviewable_id, reviewable_type)
  end

  def review_params
    params.require(:review).permit(:rating, :title, :comment, :company_id, :product_id)
  end
 
 
end
