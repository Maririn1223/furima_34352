
#テーブル設計

## users テーブル

|Column             |Type   |Options                   |
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|last_name          |string |null: false               |
|first_name         |string |null: false               |
|last_name_kana     |string |null: false               |
|first_name_kana    |string |null: false               |
|birthday           |date   |null: false               |


### Association
-has_many :items
-has_many :purchases

## products テーブル

|Column        |Type       |Options                        |
|title         |string     |null: false                    |
|text          |text       |null: false                    |
|tag_id        |integer    |null: false                    |
|condition_id  |integer    |null: false                    |
|charge_id     |integer    |null: false                    |
|prefecture_id |integer    |null: false                    |
|order_date_id |integer    |null: false                    |
|price         |integer    |null: false                    |
|user          |references |null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to_active_hash :tags
-belongs_to_active_hash :condition
-belongs_to_active_hash :charge
-belongs_to_active_hash :prefecture
-belongs_to_active_hash :order_date
-has_one :purchase

##  delivery テーブル

|Column      |Type       |Options           |
|purchase    |references |foreign_key: true |
|postal_code |string     |null: false       |
|prefecture  |integer    |null: false       |
|city        |string     |null: false       |
|address     |string     |null: false       |
|building    |string     |                  |
|phone       |string     |null: false       |

### Association
-belongs_to :purchase
-belongs_to_active_hash :prefecture

##  purchase テーブル

|Column      |Type       |Options           |
|user        |references |foreign_key: true |
|product     |references |foreign_key: true |

### Association
-belongs_to :user
-belongs_to :product
