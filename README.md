# README

## usersテーブル

|columns             |type     |options                   |
|--------------------|---------|--------------------------|
|nickname            |string   |null: false               |
|email               |string   |null: false, unique: true |
|encrypted_password  |string   |null: false               |
|first_name          |string   |null: false               |
|last_name           |string   |null: false               |
|furigana_first_name |string   |null: false               |
|furigana_last_name  |string   |null: false               |
|birth_date          |integer  |null: false               |


### Association

has_many :items
has_many :purchases


## itemsテーブル

|columns            |type       |options                         |
|-------------------|-----------|--------------------------------|
|name               |string     |null: false                     |
|explanation        |text       |null: false                     |
|category_id        |integer    |null: false                     |
|status_id          |integer    |null: false                     |
|shipping_charge_id |integer    |null: false                     |
|shipping_area_id   |integer    |null: false                     |
|days_to_ship       |integer    |null: false                     |
|price              |integer    |null: false                     |
|user               |references |null: false, foreign_key: true  |

### Association

belongs_to :user
has_one :purchase

## purchasesテーブル

|columns             |type       |options                         |
|--------------------|-----------|--------------------------------|
|user                |references |null: false, foreign_key: true  |
|item                |references |null: false, foreign_key: true  |

### Association

belongs_to :user
belongs_to :item
has_one :receiver_address

## receiver_addressテーブル

|columns        |type       |options                         |
|---------------|-----------|--------------------------------|
|postal_code    |string     |null: false                     |
|prefecture_id  |integer    |null: false                     |
|city           |string     |null: false                     |
|address        |string     |null: false                     |
|building       |string     |null: false                     |
|phone_number   |string     |null: false                     |
|purchase       |references |null: false, foreign_key: true  |

### Association

belongs_to :purchase