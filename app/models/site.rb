class Site < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :customer
  end
  has_many :markers, dependent: :destroy
  has_many :neighbors, dependent: :destroy
  has_many :businesses, dependent: :destroy

end
