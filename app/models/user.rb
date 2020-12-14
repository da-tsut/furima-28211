class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  has_one :order

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :family_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
  validates :first_name_kana
  validates :family_name_kana
  end

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: ' パスワードは半角英数字混合であること' } do
  validates :password
  end

  validates :nickname, presence: true
  validates :birth_year_month_day, presence: true
  end