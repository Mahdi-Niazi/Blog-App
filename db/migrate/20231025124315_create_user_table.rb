class CreateUserTable < ActiveRecord::Migration[7.1]
  def change
    create_table :user_tables do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter
      
      t.timestamps
    end
  end
end
