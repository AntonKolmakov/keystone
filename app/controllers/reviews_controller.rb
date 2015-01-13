class ReviewsController < ApplicationController
  before_action :authenticate_user!

  expose(:product) { Product.find(params[:product_id]) }
  expose(:review)

  def create
    review = product.reviews.build(review_params.merge!(user: current_user))
    if review.save
      redirect_to product
    else
      render "product/show"
    end
  end

  def destroy
    review.destroy
    respond_with review, location: -> { product_path(product) }
  end

  private

  def review_params
    params.require(:review).permit(:msg)
  end
end