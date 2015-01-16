class ReviewsController < ApplicationController
  before_action :authenticate_user!

  expose(:product) { Product.find(params[:product_id]) }
  expose(:review, attributes: :review_params)
  expose(:categories)
  expose(:reviews) { product.reviews }

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
    params.require(:review).permit(:msg).merge!(user: current_user)
  end
end