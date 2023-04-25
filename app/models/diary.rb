class Diary < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :start_time, presence: true
  validates :happy, presence: true
end
