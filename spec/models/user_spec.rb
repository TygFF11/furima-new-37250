require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できない' do
      it 'Emailが入力されていないとき新規登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'Emailに@がないとき新規登録できない' do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'Emailが既に使われているとき新規登録できない' do
        @anothor_user = FactoryBot.create(:user)
        @user.email = @anothor_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'Passwordが入力されていないとき新規登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'Passwordが半角英数字混合でないとき新規登録できない' do
        @user.password = "aaaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'Passwordが6文字以下のとき新規登録できない' do
        @user.password = "aaa11"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'Password_confirmationがpasswordと異なるとき新規登録できない' do
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'Nicknameが入力されていないとき新規登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'LastNameが入力されていないとき新規登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'FirstNameが入力されていないとき新規登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'LastNameが漢字・ひらがなではないとき新規登録できない' do
        @user.last_name = "hitodenashi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'FirstNameが漢字・ひらがなではないとき新規登録できない' do
        @user.first_name = "hitodenashi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'LastNameKanaが入力されていないとき新規登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'FirstNameKanaが入力されていないとき新規登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'LastNameKanaがカタカタではないとき新規登録できない' do
        @user.last_name_kana = "漢字漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'FirstNameKanaがカタカナではないとき新規登録できない' do
        @user.first_name_kana = "漢字漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'Birthdayが入力されていないとき新規登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
    context '新規登録できる' do
      it 'Email,Password,Nickname,LastName,FirstName,LastNameKana,FirstNameKana,Birthdayが正しく入力されているとき新規登録できる' do
        expect(@user).to be_valid
      end
    end
  end
  
  describe 'ログイン' do
    context 'ログインできる' do
    end
    context 'ログインできない' do
    end
  end
end
