class Record < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: 'ミルク' },
    { id: 3, name: '食事' },
    { id: 4, name: 'うんち' },
    { id: 5, name: 'おむつ' },
    { id: 6, name: 'お風呂' },
    { id: 7, name: '病院' },
    { id: 8, name: '予防接種' },
    { id: 9, name: 'お薬' },
    { id: 10, name: '睡眠' },
    { id: 11, name: '保育園・幼稚園' }
  ]

  include ActiveHash::Associations
  belongs_to :managements
end