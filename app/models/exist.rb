class Exist < ActiveHash::Base
  self.data =[
    { id: 0, name: '--' },
    { id: 1, name: '既設' },
    { id: 2, name: '新設' }
  ]

  include ActiveHash::Associations
  has_many :markers
end
