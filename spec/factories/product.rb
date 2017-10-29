FactoryGirl.define do
  factory :product do
    name {Faker::Name.name}
    price 12000
    quanlity 100
    information {Faker::Lorem.sentence}
    association :category, :factory => :category
  end
end
