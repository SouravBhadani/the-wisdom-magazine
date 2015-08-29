class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.references :user, index: true
      t.references :megazine, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :users
    add_foreign_key :articles, :megazines
  end
end
