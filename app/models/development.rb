class Development < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '開発申請' },
    { id: 2, name: '道路位置指定' },
    { id: 3, name: '条例許可' }
  ]
  include ActiveHash::Associations
  has_many :businesses
end
