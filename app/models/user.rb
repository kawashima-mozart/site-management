class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence:true do 
    validates :name
    validates :password_confirmation
  end

  has_many :user_businesses, dependent: :destroy
  has_many :businesses, through: :user_businesses
  has_many :user_schedules, dependent: :destroy
  has_many :schedules, through: :user_schedules
  has_many :comments,dependent: :destroy
  
end
