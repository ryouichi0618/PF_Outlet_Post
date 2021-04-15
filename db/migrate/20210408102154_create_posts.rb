class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.string :image_id
      t.string :title
      t.text :body
      t.integer :best_ansewer

      t.timestamps
    end
  end
end
