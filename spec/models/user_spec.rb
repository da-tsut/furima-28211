require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user =  FactoryBot.build(:user)
    end

    context 'ログインができるとき' do
      it 'ユーザー全ての情報と合致すればログインができる' do
          expect(@user).to be_valid
      end
    end

  context 'ログインができないとき' do
    it "ニックネームが必須であること" do
      @user.nickname = ""
      @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "重複したメールアドレスが存在する場合登録できないこと" do
      @user.save
      @another_user = FactoryBot.build(:user, email: @user.email)
      @another_user.valid?
        expect(@another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it "メールアドレスは＠を含む必要があること" do
      @user.email = "@"
      @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

   it "パスワードは英数字混合ではあるが、字数が5文字以下では登録できないこと" do
      @user.password = "00aa"
      @user.password_confirmation = "00aa"
      @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
   end

   it "パスワードは半角英数字混合であるが、パスワードが不一致では登録できないこと" do
     @user.password = "000aaaa"
     @user.password_confirmation = "111bbbb"
     @user.valid?
       expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
   end

   it "パスワードは半角英数字混合であること" do
     @user.password = "abc1234"
     @user.password_confirmation = "abc1234"
       expect(@user).to be_valid
   end
   it "パスワードは確認用も含めて２回入力すること" do
    @user.password = "abc1234"
    @user.password_confirmation = "abc1234"
      expect(@user).to be_valid
   end

   it "ユーザー本名の名前が必須であること" do
    @user.first_name = ""
    @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
   end

   it "ユーザー本名の苗字が必須であること" do
    @user.family_name = ""
    @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
   end

   it "ユーザー本名のフリガナの名前が必須であること" do
    @user.first_name_kana = ""
    @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください")
   end

   it "ユーザー本名のフリガナの苗字が必須であること" do
    @user.family_name_kana = ""
    @user.valid?
      expect(@user.errors.full_messages).to include("苗字カナを入力してください")
   end

   it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力させること" do
    @user.first_name = "takeru"
    @user.valid?
      expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
   end

   it "ユーザー本名の苗字は全角（漢字・ひらがな・カタカナ）で入力させること" do
    @user.family_name = "satou"
    @user.valid?
      expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")
   end

   it "ユーザー本名のフリガナの名前は全角（カタカナ）で入力させること" do
    @user.first_name_kana = "takeru"
    @user.valid?
      expect(@user.errors.full_messages).to include("名前カナは不正な値です")
   end

   it "ユーザー本名のフリガナの苗字は全角（カタカナ）で入力させること" do
    @user.family_name_kana = "satou"
    @user.valid?
      expect(@user.errors.full_messages).to include("苗字カナは不正な値です")
   end

   it "生年月日が必須であること" do
   @user.birth_year_month_day= ""
   @user.valid?
     expect(@user.errors.full_messages).to include("生年月日を入力してください")
   end
  end
 end
end