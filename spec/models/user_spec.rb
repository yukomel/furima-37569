require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザ登録が成功する場合" do

      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "ユーザ登録に失敗する場合" do

      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = 'a1234567'
        @user.encrypted_password = 'a12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "family_nameがない場合は登録できないこと" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end

      it "family_name_kanaがない場合は登録できないこと" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_name_kanaがない場合は登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dayがない場合は登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emaiは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが6文字以上ないと登録できない' do
        @user.password = 'ab000'
        @user.encrypted_password = 'ab000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end

      it "数字のみのパスワードでは登録できない" do
        @user.password = '00000'
        @user.encrypted_password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end

      it "全角文字を含むパスワードでは登録できない" do
        @user.password = 'ＡＢｃ000'
        @user.password_confirmation = 'ＡＢｃ000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end

      it "姓（全角）に半角文字が含まれていると登録できない" do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
  
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.family_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end