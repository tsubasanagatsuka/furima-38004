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

  validate :name
  validate :description
  validate :category_id
  validate :state_id
  validate :delivery_burden_id
  validates :prefecture_id
  validates :ship_day_id
  #空の投稿を保存できないようにする
  validates :title, :text, presence: true
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :state_id, numericality: { other_than: 1 , message: "can't be blank"}
end
