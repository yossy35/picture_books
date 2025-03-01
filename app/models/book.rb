class Book < ApplicationRecord
  has_one_attached :image  
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :book_genres, dependent: :destroy
end
