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
- has_many :items
- has_many :purchases





## my_addressesテーブル

| Column                | Type       | Options                                 |
| -----------------     | -----------|--------------------------               |
| postcode              | string     | null: false,                            |
| prefecture_id         | integer    | null: false,                            |
| city                  | string     | null: false,                            |
| address               | string     | null: false,                            |
| building	            | string     |                                         |
| phone_number          | string     | null: false,                            |
| purchase              | references | null: false,   foreign_key: true        |


### Association
- belongs_to :purchase



## itemsテーブル

| Column            | Type       | Options                          |
| ------------------| ---------- | ---------------------------------|
| name              | string     | null: false,                     |
| description       | text       | null: false,                     |
| state_id          | integer    | null: false,                     |
| delivery_burden_id| integer    | null: false,                     |
| prefecture_id     | integer    | null: false,                     |
| ship_day_id       | integer    | null: false,                     |
| price             | integer    | null: false,                     |
| category_id       | integer    | null: false,                     |
| user              | references | null: false,   foreign_key: true |



### Association
- belongs_to :user
- has_one :purchase




## purchasesテーブル

| Column               | Type       | Options                             
| ------------------   | ---------- | ---------------------------------   
| item                 | references    | null: false,   foreign_key: true 
| user                 | references    | null: false,   foreign_key: true 

### Association
- belongs_to :user
- belongs_to :item
- has_one :my_address




  