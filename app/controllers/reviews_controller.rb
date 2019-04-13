class ReviewsController < ApplicationController
  before_action :authenticate_user!

  expose :product, -> { Product.find(params[:product_id]) }
  expose :review
  expose :categories, -> {Category.all}
  expose :reviews, -> { product.reviews }

  def create
    if review.save
      redirect_to product
    else
      render "products/show"
    end
  end

  def destroy
    review.destroy
    respond_with review, location: -> { product_path(product) }
  end

  private

  def review_params
    params.require(:review).permit(:msg).merge!(user: current_user).merge!(product_id: product.id)
  end
end