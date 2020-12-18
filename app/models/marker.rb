class Marker < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :name_cad
    validates :type_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :exist_id
  end

  belongs_to :site
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  belongs_to :exist
end
