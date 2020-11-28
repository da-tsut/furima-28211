class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_to_ship

  with_options presence: true do
    validates :image, presence: { message: "を添付してください"}
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "はひらがなカタカナ漢字を記入してください"}
    validates :introduction, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "はひらがなカタカナ漢字を記入してください"}
    validates :price, numericality: { with: /\A[a-z0-9]+\z/i, message: "は半角数字で記入してください"}
    validates :category_id,:item_condition_id,:postage_payer_id,:prefecture_id,:day_to_ship_id, numericality: { other_than: 1, message: "を選択してください" }
  end
    validates :price, presence: { message: "を入力してください"}
    validates :price, numericality: { greater_than_or_equal_to: 300, message: "は¥300以上で入力してください"}
    validates :price, numericality: { less_than_or_equal_to: 9999999, message: "は¥9,999,999以下で入力してください"}
end