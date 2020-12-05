class Business < ApplicationRecord
  belongs_to :site
  belongs_to :user
  has_many :comments
  has_many :events

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :business_content
  belongs_to :survey
  belongs_to :development

  
  with_options presence: true do
    validates :business_content_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :survey_id, numericality: { other_than: 0, message: 'を選択してください' }, if:  :content_s
    validates :development_id, numericality: { other_than: 0, message: 'を選択してください' }, if: :content_d
    validates :order_day
    validates :survey_day
  end

  def content_s
    business_content_id == 1
  end

  def content_d
    business_content_id == 2
  end

end
