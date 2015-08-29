class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :megazine
  has_many :comments  
end
