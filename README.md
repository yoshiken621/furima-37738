# README
users_table

| Column                | Type    | Options                   |
| ------------------------------------------------------------|
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| family_name           | string  | null: false               | 
| first_name            | string  | null: false               |
| family_name_kana      | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birthday              | Date    | null: false               |

has_many :items
has_many :purchases



items_table

| Column                | Type       | Options                        |
| --------------------------------------------------------------------|
| item_name             | string     | null: false                    |
| item_detail           | text       | null: false                    |
| item_category_id      | integer    | null: false                    |
| item_status_id        | integer    | null: false                    | 
| delivery_fee_id       | integer    | null: false                    |
| delivery_day_id       | integer    | null: false                    |
| item_price            | integer    | null: false                    |
| user                  | references | null: false foreign_key: true  |
| prefecture_id         | integer    | null: false                    |

belongs_to :user
has_one :purchase


addresses_table

| Column                | Type       | Options                        |
| --------------------------------------------------------------------|
| post_code             | string     | null: false                    | 
| prefecture_id         | integer    | null: false                    |
| city_town             | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| purchase              | references | null: false, foreign_key: true |


belongs_to :purchase


purchases_table

| Column                | Type       | Options                        |
| --------------------------------------------------------------------|
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one : address


