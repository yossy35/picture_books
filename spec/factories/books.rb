FactoryBot.define do
  factory :book do
    isbn { Faker::Number.between(from: 1, to: 5) }
    title { Faker::Lorem.characters(number:10) }
    author_name { Faker::Lorem.characters(number:10) }
    review { Faker::Lorem.characters(number:30) }
    star { Faker::Number.between(from: 1, to: 5) }
    user
  end
end