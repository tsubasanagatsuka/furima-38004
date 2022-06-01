# データベース

## usersテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -------------------------------|
| name             | string     | null: false,                   |
| mail             | string     | null: false,                   |
| password         | string     | null: false,                   |
| last_name        | string     | null: false,                   |
| first_name       | string     | null: false,                   |
| last_name_kana   | string     | null: false,                   |
| first_name_kana  | string     | null: false,                   |
| birthday         | date       | null: false,                   |


### Association
- has_many_to :items
- has_many_to :buyer


## buyerテーブル

| Column                | Type       | Options                          |
| -----------------     | -----------|--------------------------        |
| postcode              | string     | null: false,                     |
| prefecture            | integer    | null: false,                     |
| city                  | string     | null: false,                     |
| block	                | string     | null: false,                     |
| building              | string     | null: false,                     |
| phone_number          | string     | null: false,                     |
| user                  | references | null: false,   foreign_key: true |


### Association
- belongs_to :user


## itemsテーブル

| Column            | Type       | Options                          |
| ------------------| ---------- | ---------------------------------|
| name              | string     | null: false,                     |
| description       | string     | null: false,                     |
| status            | string     | null: false,                     |
| delivery_burden   | string     | null: false,                     |
| shipping_area     | string     | null: false,                     |
| days _to_ship     | string     | null: false,                     |
| price             | integer    | null: false,                     |
| user              | references | null: false,   foreign_key: true |
| category          | references | null: false, foreign_key: true   |


### Association
- belongs_to :user

