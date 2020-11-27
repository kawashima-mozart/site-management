require 'rails_helper'

RSpec.describe Neighbor, type: :model do
  before do
    @neighbor = FactoryBot.build(:neighbor)
  end

  describe '近隣情報登録' do
    context '保存できるとき' do
      it '正しい値が入力されているとき' do
        expect(@neighbor).to be_valid
      end
      it '現住所が空欄でも保存できる' do
        @neighbor.address_now = nil
        expect(@neighbor).to be_valid
      end
      it '電話番号が空でも保存できる' do
        @neighbor.phone_number = nil
        expect(@neighbor).to be_valid
      end
      end
      it '状況を選択していなくても保存できる' do
        @neighbor.status_id = 0
        expect(@neighbor).to be_valid
      end
      it '立会のチェックがついていなくても保存できる' do
        @neighbor.witness = 0
        expect(@neighbor).to be_valid
      end
      it '立会日時が空でも保存できる' do
        @neighbor.witness_day = nil
        expect(@neighbor).to be_valid
      end
      it '押印のチェックがついていなくても保存できる' do
        @neighbor.imprint = 0
        expect(@neighbor).to be_valid
      end
      it '押印日時が空でも保存できる' do
        @neighbor.imprint_day = nil
        expect(@neighbor).to be_valid
      end
      it 'メモが空でも保存できる' do
        @neighbor.memo = nil
        expect(@neighbor).to be_valid
      end
    end

    context '保存できないとき' do
      it '地番が空欄のとき' do
        @neighbor.lot_number = nil
        @neighbor.valid?
        expect(@neighbor.errors.full_messages).to include('地番を入力してください')      
      end
      it '名前が空欄のとき' do
        @neighbor.name = nil
        @neighbor.valid?
        expect(@neighbor.errors.full_messages).to include('名前を入力してください')      
      end
      it '登記住所が空欄のとき' do
        @neighbor.address = nil
        @neighbor.valid?
        expect(@neighbor.errors.full_messages).to include('登記簿住所を入力してください')      
      end
      it '地番が空欄のとき' do
        @neighbor.lot_number = nil
        @neighbor.valid?
        expect(@neighbor.errors.full_messages).to include('地番を入力してください')      
      end
    end
  end
end
