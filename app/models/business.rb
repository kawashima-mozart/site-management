class Business < ApplicationRecord

  has_many :user_businesses, dependent: :destroy
  has_many :users, through: :user_businesses
  has_many :schedules, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :business_content
  belongs_to :survey
  belongs_to :development

end
