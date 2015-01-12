class Product < ActiveRecord::Base
  belongs_to :category

  def self.sortable(category_id)
    if category_id
      where(category_id: category_id)
    else
      all.order('created_at DESC')
    end
  end
end
