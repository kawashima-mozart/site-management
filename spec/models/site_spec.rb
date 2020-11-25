require 'rails_helper'

RSpec.describe Site, type: :model do
  before do
    @site = FactoryBot.build(:site)
  end

  describe '新規現場登録' do
    context '保存できるとき' do
      it '正しい値が入力されているとき' do
        expect(@site).to be_valid
      end
    end

    context '保存できないとき' do
      it '所在地番が空欄のとき' do
        @site.name = nil
        @site.valid?
        expect(@site.errors.full_messages).to include('所在地番を入力してください')      
      end
      it '顧客名が空欄のとき' do
        @site.customer = nil
        @site.valid?
        expect(@site.errors.full_messages).to include('顧客名を入力してください')      
      end
    end
  end
end