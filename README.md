# データベース

## usersテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| nickname	        | string     | null: false,                   |
| email             | string     | null: false,      unique: true |
| encrypted_password| string     | null: false,                   |
| last_name         | string     | null: false,                   |
| first_name        | string     | null: false,                   |
| last_name_kana    | string     | null: false,                   |
| first_name_kana   | string     | null: false,                   |
| birthday          | date       | null: false,                   |


### Association
- has_many_to :item
- has_many_to :purchase




## my_addressテーブル

| Column                | Type       | Options                          |
| -----------------     | -----------|--------------------------        |
| postcode              | string     | null: false,                      |
| prefecture            | integer    | null: false,                     |
| city                  | string     | null: false,                     |
| building              | string     | null: false,                     |
| block	                | string     |                                  |
| phone_number          | string     | null: false,                     |
| user                  | references | null: false,                     |


### Association
- belongs_to :purchase



## itemsテーブル

| Column            | Type       | Options                          |
| ------------------| ---------- | ---------------------------------|
| name              | string     | null: false,                     |
| description       | text       | null: false,                     |
| state_id          | integer    | null: false,                     |
| delivery_burden_id| integer    | null: false,                     |
| prefecture_id     | integer     | null: false,                     |
| ship_day_id       | integer     | null: false,                     |
| price             | integer    | null: false,                     |
| user              | integer    | null: false,   foreign_key: true |
| category_id       | integer    | null: false,   foreign_key: true |
| image             | references | null: false,   foreign_key: true |


### Association
- belongs_to :user
- has_many_to :purchase




## purchaseテーブル

| Column               | Type       | Options                             
| ------------------   | ---------- | ---------------------------------   
| item                 | reference     | null: false,   foreign_key: true 
| user                 | reference     | null: false,   foreign_key: true 

### Association
- belongs_to :user
- belongs_to :item
- has_many_to :my_address




  