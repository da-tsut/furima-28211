FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password  {"aA1#{ Faker::Internet.password}"}
    #password {password}
    password_confirmation {password}
    first_name {'健'}
    family_name {'佐藤'}
    first_name_kana {'タケル'}
    family_name_kana {'サトウ'}
    birth_year_month_day {'1982-03-20'}
  end
end
