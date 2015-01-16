FactoryGirl.define do
  factory :product do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence(3) }
  end
end
