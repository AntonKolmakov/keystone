class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  expose :category
  expose :categories, ->{ Category.all }

  def create
    category.save
    respond_with category, location: -> { edit_category_path(category) }
  end

  def update
    category.save
    respond_with category, location: -> { category_path(category) }
  end

  def destroy
    category.destroy
    respond_with category, location: -> { root_path }
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
