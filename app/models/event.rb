class Event < ApplicationRecord
  belongs_to :business
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
end
