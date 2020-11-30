class Schedule < ApplicationRecord

  belongs_to :business 
  has_many :user_schedules, dependent: :destroy
  has_many :users, through: :user_schedules
  
end
