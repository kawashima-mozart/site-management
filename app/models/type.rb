class Type < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'コンクリート杭' },
    { id: 2, name: '金属標' },
    { id: 3, name: '金属鋲' },
    { id: 4, name: '御影石' },
    { id: 5, name: '計算点' },
    { id: 6, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :markers
end
