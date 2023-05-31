class Calendar < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time,   presence: true
  validates :schedule,   presence: true
  validate  :start_end_check
  

  private

    def start_end_check
      errors.add(:end_time, "は開始時刻より前の時間には設定できません。")
      if self.start_time > self.end_time
      end
    end

end
