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

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :ship_day_id, presence: true
  validates :price, presence: true

  
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :state_id, numericality: { other_than: 1 , message: "can't be blank"}
end
