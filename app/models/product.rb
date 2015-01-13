class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order "created_at DESC" }

  validates :title, :description, presence: true

  mount_uploader :image, ImageUploader

  private

  def self.sortable(category_id)
    if category_id
      where(category_id: category_id)
    else
      all.order('created_at DESC')
    end
  end
end
