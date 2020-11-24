FactoryBot.define do
  factory :item do
    image{'png'}
    name {'秘伝'}
    introduction {'秘伝のタレ'}
    category_id {2}
    item_condition_id {2}
    postage_payer_id {2}
    prefecture_id {2}
    day_to_ship_id {2}
    price {900}
    association :user
    # user_id {1}
  end
end