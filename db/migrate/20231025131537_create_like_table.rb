class CreateLikeTable < ActiveRecord::Migration[7.1]
  def change
    create_table :like_tables do |t|
      t.bigint :author_id
      t.bigint :post_id


      t.timestamps
    end

    add_index :like_tables, :author_id
    add_index :like_tables, :post_id
    add_foreign_key :like_tables, :user_tables, column: :author_id
    add_foreign_key :like_tables, :post_tables, column: :post_id
  end
end
