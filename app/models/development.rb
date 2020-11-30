class Development < ActiveHash::Base
  self.data =[
    { id: 0, name: '--' },
    { id: 1, name: '開発業務' },
    { id: 2, name: '道路位置指定業務' },
    { id: 3, name: '条例許可業務' }
  ]
  include ActiveHash::Associations
  has_many :businesses
  end