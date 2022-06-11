class PurchaseMyAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone_number,:purchase_id, :item_id, :user_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, {length: {in: 10..11}, numericality: true}
    validates :user_id
    validates :item_id
    # validates :purchase_id
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する

    # donation_idには、変数donationのidと指定する
    MyAddress.create(postcode: postcode, prefecture_id: prefecture_id, address: address, city: city, phone_number: phone_number, building: building, purchase_id: purchase.id)
  end
end
