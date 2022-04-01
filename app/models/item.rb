class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :item_category_id, presence: true
  validates :item_status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_day_id, presence: true
  validates :item_price, presence: true
  validates :user, presence: true, foreign_key: true
  validates :prefecture_id, presence: true
end
