class Genre < ApplicationRecord
  has_many :book_genres, dependent: :destroy
end
