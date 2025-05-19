FactoryBot.define do
  factory :book do
    book.user.name { Faker::Lorem.characters(number:10) }
    # book.image
    book.title { Faker::Lorem.characters(number:10) }
    book.author_name { Faker::Lorem.characters(number:10) }
    # book.genre { Faker::Lorem.characters(number:10) }
    book.review { Faker::Lorem.characters(number:30) }
    # output_star
    # book.comments.count
  end
end