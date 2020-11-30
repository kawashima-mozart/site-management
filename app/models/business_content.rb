class BusinessContent < ActiveHash::Base
  self.data =[
    { id: 0, name: '--' },
    { id: 1, name: '測量業務' },
    { id: 2, name: '開発業務' }
  ]
  
  include ActiveHash::Associations
  has_many :businesses
end