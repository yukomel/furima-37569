 require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "test", first_name: "test", family_name_kana: "テスト", first_name_kana: "テスト", birth_day: "1990-02-10")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = User.new(nickname: "test", email: "", password: "00000000", password_confirmation: "00000000", family_name: "test", first_name: "test", family_name_kana: "テスト", first_name_kana: "テスト", birth_day: "1990-02-10")
      user.valid?
     end
   end
 end