class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :item_price, presence: true, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
  validates :image, presence: true
  validates :item_category_id, :item_status_id, :delivery_fee_id, :delivery_day_id, :prefecture_id,
            numericality: { other_than: 1, message: "を入力してください" }
end
