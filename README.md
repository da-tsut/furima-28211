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
| introduction         | text       |                                       |
| avatar               | string     |                                       |
| user                 | references | null: false, foreign_key: true        |

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :todo_lists
- has_many :user_evaluations
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :point
- has_one :profile, dependent: :destroy
- has_one :sns_authentication, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- belongs_to :user



## sending_destinations table
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code_id       | string     | null:false                     |
| prefecture_code_id | integer    | null:false                     |
| city               | string     | null:false                     |
| house_number       | string     | null:false                     |
| building_name      | string     |                                |
| phone_number       | string     | null:false                     |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to_active_hash :jp_prefecture



## points table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| point  | integer    |                                |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to:user



## user_evaluations table
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| review     | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| evaluation | references | null: false, foreign_key: true |

### Association
- belongs_to_active_hash :evaluation
- belongs_to :user
- belongs_to :item



## items table
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| price            | integer    | null: false                    |
| item_condition   | integer    | null: false                    |
| postage_payer    | integer    | null: false                    |
| prefecture_code  | integer    | null: false                    |
| category         | references | null: false                    |
| trading_status   | enum       | null: false                    |
| deal_closed_date | timestamp  |                                |

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_imgs, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hash :jp_prefecture



## item_purchase table
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| management       | references | null:false, foreign_key: true  |
| user_id          | string     | null:false                     |
| item_id          | string     | null: false                    |

## Association
- belongs_to :item_purchase
- belongs_to :user
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
| url    | string     | null:false                     |
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



## categories table
| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| name     | string | null:false |
| ancestry | string | null:false |

### Association
- has_many :items