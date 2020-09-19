# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column         | Type   | Options  |
|----------------|--------|----------|
|nickname        |string  |null: false|
|email           |string  |null: false|
|password        |string  |null: false|
|familyname      |string  |null: false|
|firstname       |string  |null: false|
|familyname_kana |string  |null: false|
|firstname_kana  |string  |null: false|
|birthday        |date    |null: false|


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type     | Options                      | 
|--------------|----------|------------------------------|
|name          |string    |null: false                   |
|details       |text      |null: false                   |
|category_id   |integer   |null: false                   |
|condition_id  |integer   |null: false                   |
|deliveryfee_id|integer   |null: false                   |
|area_id       |integer   |null: false                   |
|days_id       |integer   |null: false                   |
|price         |integer   |null: false                   |
|user          |references|null: false, foreign_key: true|


### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :deliveryfee
- belongs_to_active_hash :area
- belongs_to_active_hash :days

## addressesテーブル

| Column       | Type     | Options    |
|--------------|----------|------------|
|postal_code   |string    |null: false |
|prefectures_id|integer   |null: false |
|city          |string    |null: false |
|address       |string    |null: false |
|building      |string    |            |
|phonenumber   |string    |null: false |

### Association

- belongs_to :order
- belongs_to_active_hash :prefectures

## ordersテーブル

| Column    | Type     | Options                      |
|-----------|----------|------------------------------|
|user       |references|null: false, foreign_key: true|
|item       |references|null: false, foreign_key: true|

### Association

- has_one :address
- belongs_to :user
- belongs_to :item