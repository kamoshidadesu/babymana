class Diary < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :posted_date, presence: true
  validates :happy, presence: true
end
