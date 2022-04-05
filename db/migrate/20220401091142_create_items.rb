class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.text       :item_detail,        null: false
      t.integer    :item_category_id,   null: false
      t.integer    :item_status_id,     null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :delivery_day_id,    null: false
      t.integer    :item_price,         null: false
      t.references :user,               null: false, foreign_key: true
      t.integer    :prefecture_id,      null: false
      t.timestamps
    end
  end
end
