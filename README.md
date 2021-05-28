<<<<<<< Updated upstream
# README

This README would normally document whatever steps are necessary to get the
application up and running.
=======
#テーブル設計

## users テーブル

|Column         |Type   |Options    |
|nickname       |string |null: false|
|email          |string |null: false|
|password       |string |null: false|
|last_name      |string |null: false|
|first_name     |string |null: false|
|last_name_kana |string |null: false|
|first_name_kana|string |null: false|
|birthday       |date   |null: false|


### Association
-has_many :items
-has_many :purchase

## products テーブル

|Column      |Type       |Options           |
|image       |           |ActiveStorageで実装|
|title       |string     |null: false       |
|text        |text       |null: false       |
|tags        |integer    |null: false       |
|condition   |integer    |null: false       |
|charge      |integer    |null: false       |
|prefecture  |integer    |null: false       |
|order_date  |integer    |null: false       |
|price       |integer    |null: false       |
|user        |references |null: false       |

### Association
-belongs_to :user
-belongs_to_active_hash :tags
-belongs_to_active_hash :condition
-belongs_to_active_hash :charge
-belongs_to_active_hash :prefecture
-belongs_to_active_hash :order_date

##  item_purchases テーブル

|Column      |Type       |Options     |
|user        |references |            |
|credit      |integer    |null: false |
|exp_month   |integer    |null: false |
|exp_day     |integer    |null: false |
|code        |integer    |null: false |
|postal_code |integer    |null: false |
|prefecture  |integer    |null: false |
|city        |string     |null: false |
|address     |string     |null: false |
|building    |string     |null: false |
|phone       |integer    |null: false |
>>>>>>> Stashed changes

Things you may want to cover:

<<<<<<< Updated upstream
* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
### Association
-belongs_to :user
-belongs_to_active_hash :prefecture
>>>>>>> Stashed changes
