class Management < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :record
  validates :record_id, presence: true
  
  # ジャンルの選択が「せ」の時は保存できないようにする
  validates :record_id, numericality: { other_than: 1, message: "を選択してください" }
end
