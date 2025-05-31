FactoryBot.define do
  factory :book do
    isbn { Faker::Number.between(from: 1, to: 13) }
    title { Faker::Lorem.characters(number:10) }
    author_name { Faker::Lorem.characters(number:10) }
    review { Faker::Lorem.characters(number:30) }
    star { Faker::Number.between(from: 1, to: 5) }
    user
    trait :skip_validations do
      to_create { |book| book.save(validate: false) }
    end
  end
end