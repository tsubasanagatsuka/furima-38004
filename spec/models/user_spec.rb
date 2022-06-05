require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが半角でなければ登録できない' do
        @user.password = 'ＡＢｃ１２３'
        @user.password_confirmation = 'ＡＢｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '890iop'
        @user.password_confirmation = '123qwe'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '1a'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'last_nameが空では登録できない' do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_nameが全角文字でなければ登録できない' do
        @user.last_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
      end

      it 'first_nameが全角文字でなければ登録できない' do
        @user.first_name = 'huga'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'あ'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'あ'  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it 'birthdatが空では登録できない' do
        @user.birthday = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end