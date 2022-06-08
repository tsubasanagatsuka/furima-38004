class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  
  
# アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :state
  belongs_to :delivery_burden
  belongs_to :ship_day

  # has_one :purchases
  has_one_attached :image
  
  validates :user_id, presence: true
  validates :image, presence: true
  validates :name, presence: true, length: {maximum: 40}
  validates :description, presence: true, length: {maximum: 1000}
  validates :category_id, presence: true, numericality: { other_than: 0 } 
  validates :state_id, presence: true, numericality: { other_than: 0 } 
  validates :delivery_burden_id, presence: true, numericality: { other_than: 0 } 
  validates :prefecture_id, presence: true, numericality: { other_than: 0 } 
  validates :ship_day_id, presence: true, numericality: { other_than: 0 } 
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , only_integer: true }
end
