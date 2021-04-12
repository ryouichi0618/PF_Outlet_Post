class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.integer :ansewer_id
      t.integer :post_id
      t.text :body

      t.timestamps
    end
  end
end
