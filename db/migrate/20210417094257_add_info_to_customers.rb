class AddInfoToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :info, :text
  end
end
