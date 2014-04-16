FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation { |u| u.password }
  end

  factory :property do
    name { Faker::Lorem.words(6).join(" ") }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.city }
    rental_type { "Entire Place"}
    price_day { Faker::Number.number(4) }
  end
end
