class Neighbor < ApplicationRecord
  with_options presence: true do
    validates :lot_number
    validates :name
    validates :address
    validates :status_id
  end
  belongs_to :site
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
end
