require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '保存できるとき' do
      it '正しい値が入力されているとき' do
        binding.pry
        expect(@user).to be_valid
      end
    end

    context '保存できないとき' do
      it '名前が空欄のとき' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')      
      end
      it 'Eメールが空欄のとき' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')      
      end
      it '同じEメールが登録されているとき' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')      
      end
      it 'パスワードが空欄のとき' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')      
      end
      it 'パスワードが５文字以下のとき' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')      
      end
      it '確認用パスワードが空欄のとき' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）を入力してください')      
      end
      it 'パスワードと確認用パスワードが異なるとき' do
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')      
      end
    end
  end
end
