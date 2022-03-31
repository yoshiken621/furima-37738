# README
users_table

| Column                | Type    | Options                |
| ---------------------------------------------------------|
| nickname              | string  | null: false            |
| email                 | string  | NOT null, unique: true |
| encrypted_password    | string  | NOT null               |
| family_name           | string  | NOT null               | 
| first_name            | string  | NOT null               |
| family_name_kana      | string  | NOT null               |
| first_name_kana       | string  | NOT null               |
| birthday              | Date    | NOT null               |

has_many :items
has_one :purchases



items_table

| Column                | Type       | Options                     |
| -----------------------------------------------------------------|
| item_name             | string     | NOT null                    |
| item_detail           | text       | NOT null                    |
| item_category_id      | integer    | NOT null                    |
| item_status_id        | integer    | NOT null                    | 
| delivery_fee_id       | integer    | NOT null                    |
| delivery_days_id      | integer    | NOT null                    |
| item_price            | integer    | NOT null                    |
| user                  | references | NOT null foreign_key: true  |
| item_place            | string     | NOT null                    |

belongs_to :user
has_one :purchase


addresses_table

| Column                | Type       | Options         |
| -----------------------------------------------------|
| post_code             | string     | NOT null        | 
| prefecture_id         | integer    | NOT null        |
| city_town             | string     | NOT null        |
| address               | string     | NOT null        |
| building_name         | string     |                 |
| phone_number          | string     | NOT null        |
| purchase              | references | NOT null 外部キー |


belongs_to :purchase


purchases_table

| Column                | Type       | Options                     |
| -----------------------------------------------------------------|
| user                  | references | NOT null, foreign_key: true |
| item                  | referemces | NOT null, foreign_key: true |

belongs_to :user
belongs_to :item
has_one : address


