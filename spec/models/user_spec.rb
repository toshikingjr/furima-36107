require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do
    context 'userテーブルに保存できる場合' do
      it '入力情報が全て揃っていれば、登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'userテーブルに保存できない場合' do
      describe '新規登録/ユーザー情報' do
        it 'ニックネームが未入力' do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'メールアドレスが未入力' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'メールアドレスが一意性でない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'メールアドレスが＠を含まない' do
          @user.email = "aaaaaaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'パスワード未入力' do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードは６文字未満の場合' do
          @user.password = "00sss"
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'パスワードは半角英字のみでの入力' do
          @user.password = "aaaaaa"
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードは半角数字のみでの入力' do
          @user.password = "000000"
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードが全角文字の場合' do
          @user.password = 'ａａａａａ０００'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードとパスワード（確認）は値が一致しない' do
          @user.password = "a00000"
          @user.password_confirmation = "b00000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
      describe '新規登録/本人情報確認' do
        it '名前（全角）の名前がない' do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it '名前（全角）の苗字がない' do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it '名前（全角）の名前を半角英字で入力した場合' do
          @user.first_name = "tamaki"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it '名前（全角）の苗字を半角数字で入力した場合' do
          @user.last_name = "2111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end 
        it '名前カナ（全角）の苗字が未入力' do
          @user.furigana_last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
        end
        it '名前カナ（全角）の名前が未入力' do
          @user.furigana_first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Furigana first name can't be blank")
        end
        it '名前カナ（全角）の名前を半角英字で入力した場合' do
          @user.furigana_first_name = "tamaki"
          @user.valid?
          expect(@user.errors.full_messages).to include("Furigana first name is invalid")
        end
        it '名前カナ（全角）の苗字を全角（ひらがな・漢字）で入力した場合' do
          @user.furigana_last_name = "玉置こうじ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Furigana last name is invalid")
        end
        it '生年月日が未入力の場合' do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
