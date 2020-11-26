require 'rails_helper'

RSpec.describe Marker, type: :model do
  before do
    @marker = FactoryBot.build(:marker)
  end

  describe '境界標登録' do
    context '保存できるとき' do
      it '正しい値が入力されているとき' do
        expect(@marker).to be_valid
      end
      it 'exist_idが０でも保存できる' do
        @marker.exist_id = 0
        expect(@marker).to be_valid
      end
      it 'imageが空でも保存できる' do
        @marker.images = nil
        expect(@marker).to be_valid
      end
    end

    context '保存できないとき' do
      it '点番が空欄のとき' do
        @marker.name = nil
        @marker.valid?
        expect(@marker.errors.full_messages).to include('点番を入力してください')      
      end
      it '点番（CAD）が空欄のとき' do
        @marker.name_cad = nil
        @marker.valid?
        expect(@marker.errors.full_messages).to include('点番（CAD)を入力してください')      
      end
      it '境界種類が０のとき' do
        @marker.type_id = 0
        @marker.valid?
        expect(@marker.errors.full_messages).to include('境界種類を選択してください')      
      end
    end
  end
end
