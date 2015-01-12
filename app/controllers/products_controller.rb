class ProductsController < ApplicationController
  expose(:products) { Product.sortable(params[:category]) }
  expose(:categories)
end
