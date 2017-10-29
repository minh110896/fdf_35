FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    password "123123123"
    password_confirmation "123123123"
    admin 1
    email { Faker::Internet.email }
    address {Faker::Address.city}
  end
end
