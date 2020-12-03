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
    if end_day !=  nil
      if end_day < start_day
        errors.add(:end_day, 'は予定日以降のものを選択してください')
      end
    end
  end
end
