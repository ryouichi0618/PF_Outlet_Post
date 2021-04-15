class CreateAnsewers < ActiveRecord::Migration[5.2]
  def change
    create_table :ansewers do |t|
      t.integer :customer_id
      t.integer :post_id
      t.text :body
      t.integer :best_ansewer

      t.timestamps
    end
  end
end
