# README

## usersテーブル

columns             |type     |options
--------------------|---------|--------------------------
nickname            |string   |null: false
email               |string   |null: false, unique: true
encrypted_password  |string   |null: false
first_name          |string   |null: false
last_name           |string   |null: false
furigana_first_name |string   |null: false
furigana_last_name  |string   |null: false
birth_day           |integer  |null: false
birth_month         |integer  |null: false
birth_year          |integer  |null: false

### Association

has_many :items
has_many :purchases


## itemsテーブル

columns         |type       |options
----------------|-----------|-------------------------------
name            |string     |null: false
explanation     |text       |null: false
category        |string     |null: false
status          |string     |null: false
shipping_charge |string     |null: false
shipping_area   |string     |null: false
days_to_ship    |string     |null: false
price           |integer    |null: false
user_id         |references |null: false, foreign_key: true

### Association

belongs_to :user
has_one :purchase

## purchasesテーブル

columns             |type       |options
--------------------|-----------|-------------------------------
credit_card_number  |integer    |null: false
effective_day       |integer    |null: false
effective_month     |integer    |null: false
security_code       |integer    |null: false
user_id             |references |null: false, foreign_key: true
item_id             |references |null: false, foreign_key: true

### Association

belongs_to :user
belongs_to :item
has_one :receiver_address

## receiver_address

columns       |type       |options
--------------|-----------|-----------
postal_code   |string     |null: false
prefecture    |string     |null: false
city          |string     |null: false
address       |string     |null: false
building      |string     |null: false
phone_number  |integer    |null: false
purchase_id   |references |null: false, foreign_key: true

### Association