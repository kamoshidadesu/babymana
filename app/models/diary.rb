class Diary < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :start_time, presence: true
  validates :happy, presence: true
  validate :one_event_per_day, on: :create 
  validate :one_event_per_day_edit, on: :update 

  private

  def one_event_per_day
    if self.class.where(start_time: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).exists?
      errors.add(:base, 'You can only create one event per day.')
    elsif start_time.present? && self.class.where(start_time: start_time.beginning_of_day..start_time.end_of_day).exists?
      errors.add(:start_time, 'You have already created an event for this time.')
    end
  end
end

def one_event_per_day_edit
  if self.class.where(start_time: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).where.not(id: self.id).exists?
    errors.add(:base, 'You can only create one event per day.')
  elsif start_time.present? && self.class.where(start_time: start_time.beginning_of_day..start_time.end_of_day).where.not(id: self.id).exists?
    errors.add(:start_time, 'You have already created an event for this time.')
  end
end