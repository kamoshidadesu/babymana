class Management < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :record

  validates :record_id, presence: true
  
  # ジャンルの選択が「せ」の時は保存できないようにする
  validates :record_id, numericality: { other_than: 1, message: "can't be blank" }
end
