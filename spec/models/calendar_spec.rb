require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @calendar = FactoryBot.build(:calendar)
  end

  describe '予定の保存' do
    context ' 予定の保存ができる時' do
      it 'start_timeとend_timeとscheduleが存在すれば保存できる' do
        expect(@calendar).to be_valid
      end
    end
    context '予定の保存ができない時' do
      it 'start_timeがend_timeがよりも後の場合' do
        @calendar.start_time  = Time.now
        @calendar.end_time = Time.now - 1.hour
        @calendar.valid?
        expect(@calendar.errors[:end_time]).to include("は開始日時より前の時間には設定できません。")
      end
      it 'scheduleが空の場合' do
        @calendar.schedule = ''
        @calendar.valid?
        expect(@calendar.errors.full_messages).to include("予定を入力してください")
      end
    end
  end
end
