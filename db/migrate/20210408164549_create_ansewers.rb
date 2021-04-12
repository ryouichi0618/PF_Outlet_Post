class CreateAnsewers < ActiveRecord::Migration[5.2]
  def change
    create_table :ansewers do |t|
      t.integer :customer_id
      t.integer :post_id
      t.text :body
      t.boolean :best_ansewer,default: false

      t.timestamps
    end
  end
end
