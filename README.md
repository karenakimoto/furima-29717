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
|birthday        |datetime|null: false|


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column    | Type     | Options                      | 
|-----------|----------|------------------------------|
|name       |string    |null: false                   |
|details    |text      |null: false                   |
|category   |string    |null: false                   |
|condition  |string    |null: false                   |
|deliveryfee|string    |null: false                   |
|area       |string    |null: false                   |
|days       |string    |null: false                   |
|price      |integer   |null: false                   |
|user       |references|null: false, foreign_key: true|


### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column    | Type     | Options                      |
|-----------|----------|------------------------------|
|postal_code|integer   |null: false                   |
|prefectures|string    |null: false                   |
|city       |string    |null: false                   |
|address    |string    |null: false                   |
|building   |string    |                              |
|phonenumber|integer   |null: false                   |
|user       |references|null: false, foreign_key: true|
|item       |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item