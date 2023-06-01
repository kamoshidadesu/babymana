require 'rails_helper'

RSpec.describe Management, type: :model do
  before do
    @management = FactoryBot.build(:management)
  end

  describe '管理の保存' do
    context '管理の保存ができる時' do
      it 'start_timeとrecord_idが存在すれば保存できる' do
        expect(@management).to be_valid
      end
    end
    context '管理の保存ができない時' do
      it 'start_timeが空では保存できない' do
        @management.start_time = ''
        @management.valid?
        expect(@management.errors.full_messages).to include("Start timeを入力してください")
      end
      it '管理が『選択してください』では保存できない' do
        @management.record_id = 1
        @management.valid?
        expect(@management.errors.full_messages).to include("記録を選択してください")
      end
    end
  end
end
