class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :isbn
      t.string :title
      t.string :author_name
      t.timestamps
    end
  end
end
