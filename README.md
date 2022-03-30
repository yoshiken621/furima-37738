# README
users_table

| Column                | Type    | Options  |
| -------------------------------------------|
| nickname              | string  | NOT null |
| email                 | string  | NOT null |
| encrypted_password    | string  | NOT null |
| family_name           | string  | NOT null | 
| first_name            | string  | NOT null |
| family_name_kana      | string  | NOT null |
| first_name_kana       | string  | NOT null |
| birthday              | integer | NOT null |

has_many :items
has_one :purchase


items_table

| Column                | Type       | Options        |
| ----------------------------------------------------|
| item_name             | string     | NOT null       |
| item_detail           | text       | NOT null       |
| item_category         | string     | NOT null       |
| item_status           | string     | NOT null       | 
| delivery_fee          | string     | NOT null       |
| delivery_days         | string     | NOT null       |
| item_price            | integer    | NOT null       |
| user                  | references | NOT null 外部キー |

belongs_to :user
has_one :purchase


purchases_table

| Column                | Type       | Options         |
| -----------------------------------------------------|
| card_number           | integer    | NOT null        |
| card_expiry           | integer    | NOT null        |
| card_security_code    | integer    | NOT null        |
| post_code             | integer    | NOT null        | 
| prefecture            | string     | NOT null        |
| city_town             | string     | NOT null        |
| address               | integer    | NOT null        |
| building_name         | string     |                 |
| phone_number          | integer    | NOT null        |
| user                  | references | NOT null 外部キー |
| item                  | references | NOT null 外部キー |

belongs_to :user
belongs_to :item

