class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :require_admin, only: [:update, :edit, :new, :create]

  expose(:products) { Product.sortable(params[:category]) }
  expose(:categories)
  expose(:product, attributes: :product_params)
  expose(:reviews) { product.reviews }

  def create
    product.save
    respond_with product, location: -> { product_path(product) }
  end

  def update
    product.save
    respond_with product, location: -> { product_path(product) }
  end

  def destroy
    product.destroy
    respond_with product, location: -> { root_path }
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :image, :category_id)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
