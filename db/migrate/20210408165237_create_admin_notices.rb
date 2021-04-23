class CreateAdminNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_notices do |t|
      t.string :title_notice
      t.text :body_notice

      t.timestamps
    end
  end
end
