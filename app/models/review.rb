class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :msg, presence: true
end
