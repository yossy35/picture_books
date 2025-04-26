class Book < ApplicationRecord
  has_one_attached :image  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  validates :title, presence: true
  validates :author_name, presence: true
  validates :review, presence: true
  validates :star, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    else
      Book.where('title LIKE ?', '%' + content + '%')
    end
  end

end
