class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :uid, :string
    add_column :customers, :provider, :string
  end
end
