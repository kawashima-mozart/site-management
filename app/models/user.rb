class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence:true do 
    validates :name
    validates :password_confirmation
  end

  has_many :businesses
  has_many :comments
  has_many :events

end
