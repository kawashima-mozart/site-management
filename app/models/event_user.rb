class EventUser < ApplicationRecord
  belomgs_to :user
  belongs_to :event
end
