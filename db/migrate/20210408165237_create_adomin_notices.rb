class CreateAdominNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :adomin_notices do |t|
      t.string :title_notice
      t.text :body_notice

      t.timestamps
    end
  end
end
