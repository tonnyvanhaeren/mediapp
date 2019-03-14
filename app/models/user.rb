class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :first_name,  :presence => true,
            :length => { :maximum => 50 }

  validates :last_name,   :presence => true,
            :length => { :maximum => 150 }

  def fullname
    "#{self.first_name} #{self.last_name}" 
  end            
end
