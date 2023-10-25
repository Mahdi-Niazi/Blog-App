class CreatePostTable < ActiveRecord::Migration[7.1]
  def change
    create_table :post_tables do |t|
      t.bigint :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
    add_index :post_tables, :author_id
    add_foreign_key :post_tables, :user_tables, column: :author_id
  end
end
