class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :user
  has_one :item_purchase
  belongs_to_active_hash :jp_prefecture
  has_one_attached :image
end
