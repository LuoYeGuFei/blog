class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title,           null: false
      t.text :content
      t.integer :view_count,     null: false
      t.integer :user_id,        null: false
      t.integer :category_id,    null: false

      t.timestamps

      t.index [:user_id]
      t.index [:user_id, :category_id]
    end
  end
end
