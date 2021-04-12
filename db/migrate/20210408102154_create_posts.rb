class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.string :image_id
      t.string :title
      t.text :body
      t.boolean :best_ansewer,default: false

      t.timestamps
    end
  end
end
