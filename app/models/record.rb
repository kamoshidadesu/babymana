class Record < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: 'ミルク', image_path: "milk.png" },
    { id: 3, name: '食事', image_path: 'meal' },
    { id: 4, name: 'うんち', image_path: 'poop' },
    { id: 5, name: 'おむつ', image_path: 'diapers' },
    { id: 6, name: 'お風呂', image_path: 'bath' },
    { id: 7, name: '病院', image_path: 'hospital' },
    { id: 8, name: '予防接種', image_path: 'injection' },
    { id: 9, name: 'お薬', image_path: 'medicine' },
    { id: 10, name: '睡眠', image_path: 'sleep' },
    { id: 11, name: '保育園・幼稚園', image_path: 'nursery school' }
  ]

  include ActiveHash::Associations
  belongs_to :managements
end