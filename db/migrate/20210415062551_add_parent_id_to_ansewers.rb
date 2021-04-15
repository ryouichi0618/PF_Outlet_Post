class AddParentIdToAnsewers < ActiveRecord::Migration[5.2]
  def change
    add_reference :ansewers, :parent, foreign_key: { to_table: :ansewers }
  end
end
