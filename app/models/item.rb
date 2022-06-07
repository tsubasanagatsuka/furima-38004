class Item < ApplicationRecord

  belongs_to :users

  # has_one :purchases
  has_one_attached :image

  # validates :description
  # validates :category_id
  validates :state_id
  validates :delivery_burden_id
  validates :prefecture_id
  validates :ship_day_id
end
