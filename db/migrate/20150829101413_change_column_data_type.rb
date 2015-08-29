class ChangeColumnDataType < ActiveRecord::Migration
  def self.up
   change_column :articles, :body, :text
  end

  def self.down
   change_column :articles, :body, :string
  end
end
