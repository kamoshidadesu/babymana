class Diary < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :start_time, presence: true
  validates :happy, presence: true
  validate :one_event_per_day, on: :create 
  validate :one_event_per_day_edit, on: :update 

  private

  def one_event_per_day
    if Diary.where(start_time: start_time.beginning_of_day..start_time.end_of_day).exists?
      errors.add(:start_time, 'は一日一つしか書けません')
    end
  end

  def one_event_per_day_edit
    if Diary.where(start_time: start_time.beginning_of_day..start_time.end_of_day).where.not(id: id).exists?
      errors.add(:start_time, 'は一日一つしか書けません')
    end
  end
end