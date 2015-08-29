class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many   :replies, class_name: "Comment", foreign_key: "parent"
 
end

