class UserBusinessSchedule
  include ActiveModel::Model
  attr_accessor :business_content_id, :survey_id, :development_id, :order_day, :delivery_day, :site_id, :name, :start, :done, :user_id, :business_id, :schedule_id, :site_id

  with_options presence: true do
    validates :name
    validates :start
  end
  
  validates :order_day,presence: true
  validates :business_content_id, numericality: {other_than:0, message: 'を選択してください' }
  validates :survey_id, numericality: {other_than:0, message: 'を選択してください' }, if: :was_exists?
  validates :user_id,numericality: {other_than:0, message: 'を選択してください' }

  def was_exists?
    self.development_id == '0'
  end

  def save
    business = Business.create(business_content_id: business_content_id, survey_id: survey_id, development_id: development_id, order_day: order_day, delivery_day: delivery_day, site_id: site_id)
    schedule = Schedule.create(name: name, start: start, done: done, business_id: business.id)
    UserBusiness.create(user_id: user_id, business_id: business.id)
    UserSchedule.create(user_id: user_id, schedule_id: schedule.id)
  end
end