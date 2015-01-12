class ProductsController < ApplicationController
  expose(:products) { Product.sortable(params[:category]) }
  expose(:categories)
  expose(:product, attributes: :product_params)

  def create
    product.save
    respond_with product, location: -> { product_path(product) }
  end

  def update
    product.save
    respond_with product, location: -> { product_path(product) }
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :image, :category_id)
  end
end
