class Survey < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '測量承諾印' },
    { id: 2, name: '測量承諾印・登記' },
    { id: 3, name: '測量境界確定' },
    { id: 4, name: '測量境界確定・登記' },
    { id: 5, name: '机上測量・登記' },
    { id: 6, name: '登記' },
    { id: 7, name: '現況測量' },
    { id: 8, name: '境界設置' },
    { id: 9, name: '通行掘削' },
    { id: 10, name: '基準法43条業務' },
    { id: 11, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :businesses
end
