require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe '日記の保存' do
    context '日記の保存ができる時' do
      it 'start_timeとhappyが存在すれば保存できる' do
        expect(@diary).to be_valid
      end
      context '日記の保存ができない時' do
        it 'start_timeが空では保存できない' do
          @diary.start_time = ''
          @diary.valid?
          expect(@diary.errors.full_messages).to include("日にちを入力してください")
        end
        it 'happyが空では保存できない' do
          @diary.happy = ''
          @diary.valid?
          expect(@diary.errors.full_messages).to include("嬉しかったことを入力してください")  
        end
      end
    end
  end
end
