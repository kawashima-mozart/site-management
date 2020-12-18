class Event < ApplicationRecord
  belongs_to :business, optional: true
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :start_day
  end
  validate :end_day_check

  private

  def end_day_check
    unless end_day.nil?
      errors.add(:end_day, 'は予定日以降のものを選択してください') if end_day < start_day
    end
  end
end
