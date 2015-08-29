class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
#  attr_accessible :first_name ,:fullname ,:last_name

  has_many :articles  
  has_many :magazines 
  has_many :comments 

  def fullname
  	"#{self.first_name} #{self.last_name}"
  end    
end
