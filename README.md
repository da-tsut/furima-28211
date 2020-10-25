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
| ---------------- ----| ---------- | ------------------------------------- |
| nickname             | string     | null: false                           |
| password             | string     | null: false                           |
| email                | string     | null: false, unique: true, index:true |
| first_name           | string     | null:false                            |
| family_name          | string     | null:false                            |
| first_name_kana      | string     | null:false                            |
| family_name_kana     | string     | null:false                            |
| birth_year_month_day | date       | null:false                            |

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :profile, dependent: :destroy
- has_one :sns_authentication, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :item_purchase


## sending_destinations table
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null:false                     |
| prefecture_code_id | integer    | null:false                     |
| city               | string     | null:false                     |
| house_number       | string     | null:false                     |
| building_name      | string     |                                |
| phone_number       | string     | null:false                     |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to_active_hash :jp_prefecture



## items table
| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| introduction        | text    | null: false |
| price_id            | integer | null: false |
| item_condition_id   | integer | null: false |
| postage_payer_id    | integer | null: false |
| prefecture_code_id  | integer | null: false |
| item_purchase_id    | integer | null: false |

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_imgs, dependent: :destroy 
- belongs_to_active_hash :jp_prefecture
- has_one :item_purchase



## item_purchase table
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

## Association
- belongs_to :item



## brands table
| Column | Type   | Options |
| ------ | ------ | ------- |
| name   | string |         |

### Association
- has_many :items



## item_imgs table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| url    | string     | null: false                    |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item



## favorites table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item



## comments table
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| created_at | timestamp  | null: false                    |

### Association
- belongs_to :user
- belongs_to :item