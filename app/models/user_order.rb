class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number,:user_id,:item_id,:token


  with_options presence: true do
    validates :token, :house_number, :user_id, :item_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "はひらがなカタカナ漢字を記入してください"}
    validates :phone_number, numericality: { with: /\A[a-z0-9]+\z/i, message: "は半角数字で記入してください"}
    validates :phone_number, length: { is: 11, message: "は11桁で記入して下さい" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角数字で記入してください"}
    validates :prefecture_id,  numericality: { other_than: 1, message: "を選択してください" }
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_code:postal_code, prefecture_id:prefecture_id, city:city, house_number:house_number, building_name:building_name, phone_number:phone_number, order_id: order.id)
  end
end