class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true
      t.references :article, index: true
      t.integer :parent

      t.timestamps null: false
    end
  end
end
