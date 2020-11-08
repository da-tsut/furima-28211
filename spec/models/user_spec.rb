require 'rails_helper'
 
RSpec.describe User, type: :model do
  describe 'ユーザー情報' do
    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicname can't be blank")
    end
   it "メールアドレスが必須であること" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it "重複したメールアドレスが存在する場合登録できないこと" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it "メールアドレスは＠を含む必要があること" do
    @user.email = "@"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is necessary to include '@' ")
  end
   it "パスワードが必須であること" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end
   it "パスワードは6文字以上であること" do
     @user.password = "00000"
     @user.password_confirmation = "00000"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end
   it "パスワードとパスワード確認が不一致では登録できないこと" do
    @user.password = "123456"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it "パスワードは半角英数字混合であること" do
    @user.password = "abc123"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
  end
  it "パスワードは確認用も含めて２回入力すること" do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is input twice for confirmation.")
  end
    it "ユーザー本名が苗字と名前がそれぞれ必須であること" do
      @user.first_name = nil
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name and family name can't be blank")
    end
    it "ユーザー本名のフリガナが苗字と名前でそれぞれ必須であること" do
      @user.first_name_kana = nil
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana and family name kana can't be blank")
    end
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = "寿・あ・ア"
      @user.family_name = "寿・あ・ア"
      @user.valid?
      expect(@user.errors.full_messages).to include("The user name makes them input by the full-width (kanji, hiragana and katakana)")
  end
  it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
    @user.first_name_kana = "ア"
    @user.family_name_kana = "ア"
    @user.valid?
    expect(@user.errors.full_messages).to include("The user name kana makes them input by the full-width (Katakana)")
  end
 it "生年月日が必須であること" do
  @user.birth_year_mouth_day= nil
  @user.valid?
  expect(@user.errors.full_messages).to include("Birthday can't be blank")
 end
end
end