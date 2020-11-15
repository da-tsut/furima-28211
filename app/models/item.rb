class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :user
  has_one :item_purchase
  belongs_to_active_hash :jp_prefecture
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postege_payer
  belongs_to_active_hash :sending_day
  belongs_to_active_hash :shipping_charges
end
