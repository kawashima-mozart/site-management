class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '会えていない' },
    { id: 1, name: '手紙等反応待ち' },
    { id: 2, name: '挨拶済み' }
  ]

  include ActiveHash::Associations
  has_many :neighbors
end
