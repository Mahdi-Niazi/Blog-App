class CreateCommentTable < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_tables do |t|
      t.bigint :author_id
      t.bigint :post_id
      t.text :text

      t.timestamps
    end

    add_index :comment_tables, :author_id
    add_index :comment_tables, :post_id
    add_foreign_key :comment_tables, :user_tables, column: :author_id
    add_foreign_key :comment_tables, :post_tables, column: :post_id
  end
end
