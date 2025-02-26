class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :review
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
