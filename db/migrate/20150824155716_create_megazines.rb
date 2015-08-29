class CreateMegazines < ActiveRecord::Migration
  def change
    create_table :megazines do |t|
      t.string :title
      t.date :published
      t.string :user_id

      t.timestamps null: false
    end
  end
end
