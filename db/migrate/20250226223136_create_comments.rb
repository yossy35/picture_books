class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :review_id
      t.text :comment
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
