class Site < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :customer
  end
end
