class Book < ApplicationRecord
  has_one_attached :image  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :book_genres, dependent: :destroy

  validates :title, presence: true
  validates :author_name, presence: true
  validates :review, presence: true
end
