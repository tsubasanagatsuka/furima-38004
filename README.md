# データベース

## usersテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -------------------------------|
| nickname	       | string     | null: false,                   |
| email            | string     | null: false,      unique: true |
| encrypted_password| string    | null: false,                   |
| last_name        | string     | null: false,                   |
| first_name       | string     | null: false,                   |
| last_name_kana   | string     | null: false,                   |
| first_name_kana  | string     | null: false,                   |
| birthday         | date       | null: false,                   |


### Association
- has_many_to :items
- has_many_to :my_address
- has_many_to :purchase




## my_addressテーブル

| Column                | Type       | Options                          |
| -----------------     | -----------|--------------------------        |
| postcode              | string    | null: false,                    |
| prefecture            | integer    | null: false,                     |
| city                  | string     | null: false,                     |
| building              | string     | null: false,                     |
| block	                | string     |                                  |
| phone_number          | string     | null: false,                     |
| user                  | references | null: false,                     |


### Association
- belongs_to :user



## itemsテーブル

| Column            | Type       | Options                          |
| ------------------| ---------- | ---------------------------------|
| name              | string     | null: false,                     |
| description       | string     | null: false,                     |
| status            | integer    | null: false,                     |
| delivery_burden   | string     | null: false,                     |
| shipping_area_id  | string     | null: false,                     |
| days _to_ship     | string     | null: false,                     |
| price             | integer    | null: false,                     |
| user              | references | null: false,   foreign_key: true |
| category          | references | null: false,   foreign_key: true |
| image             | references | null: false,   foreign_key: true |


### Association
- belongs_to :user
- has_many_to :purchase




## purchaseテーブル

| Column               | Type       | Options                             |
| ------------------   | ---------- | ---------------------------------   |
| items                | reference     | null: false,   foreign_key: true |
| user                 | reference     | null: false,   foreign_key: true |
| Shipping             | reference     | null: false,   foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items




  