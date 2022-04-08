class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_town, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city_town
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id )
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city_town: city_town, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end