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

## users table
| Column               | Type       | Options                               |
| -------------------- | ---------- | ------------------------------------- |
| nickname             | string     | null: false                           |
| encrypted_password   | string     | null: false                           |
| email                | string     | null: false, unique: true, index:true |
| first_name           | string     | null:false                            |
| family_name          | string     | null:false                            |
| first_name_kana      | string     | null:false                            |
| family_name_kana     | string     | null:false                            |
| birth_year_month_day | date       | null:false                            |

### Association
- has_one :address
- has_one :order



## address table
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null:false                     |
| prefecture_id      | integer    | null:false                     |
| city               | string     | null:false                     |
| house_number       | string     | null:false                     |
| building_name      | string     |                                |
| phone_number       | string     | null:false                     |
| order_id           | integer    | null:false                     |

### Association
- belongs_to :order



## items table
| Column                | Type    | Options                        |
| --------------------- | ------- | ------------------------------ |
| name                  | string  | null: false                    |
| introduction          | text    | null: false                    |
| category_id           | integer | null: false                    |
| item_condition_id     | integer | null: false                    |
| postage_payer_id      | integer | null: false                    |
| prefecture_id         | integer | null: false                    |
| day_to_ship_id        | integer | null: false                    |
| price                 | integer | null: false                    |
| user_id               | integer | null: false, foreign_key: true |


### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- belongs_to :user
- has_one :item_purchase
- belongs_to_active_hash :jp_prefecture


## order table
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user
- has_one :address

