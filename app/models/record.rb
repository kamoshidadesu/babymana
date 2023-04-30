class Record < ActiveHash::Base
  self.data = [
    { id: 1, name: '___' },
    { id: 2, name: 'ミルク', image_path: 'milk.png' },
    { id: 3, name: 'meal', image_path: 'meal' },
    { id: 4, name: 'poop', image_path: 'poop' },
    { id: 5, name: 'bath', image_path: 'bath' },
    { id: 6, name: 'hospital', image_path: 'hospital' },
    { id: 7, name: 'injection', image_path: 'injection' },
    { id: 8, name: 'medicine', image_path: 'medicine' },
    { id: 9, name: 'sleep', image_path: 'sleep' }
  ]

  include ActiveHash::Associations
  has_many :managements
end





s