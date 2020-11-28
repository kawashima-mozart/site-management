class Site < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :customer
  end
  has_many :businesses
  has_many :markers, dependent: :destroy
  has_many :neighbors, dependent: :destroy
end
