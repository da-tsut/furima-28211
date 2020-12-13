require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: seller) #sellerで作ったidを入れる
    @item.image = fixture_file_upload('spec/system/sample.jpg', 'spec/system/image.jpg')
    @item.save
    @order = FactoryBot.build(:user_order, item_id: @item.id, user_id: buyer.id) #buyerで作ったidを入れる
  end

  describe '購入画面' do
    context 'ログインしているユーザーだけが、購入画面へ遷移できること' do
      it 'ユーザー全ての情報と合致すれば出品できる' do
        expect(@order).to be_valid
      end

      it "userとitemがあれば保存ができること" do
        expect(@order).to be_valid
      end
    end

    context '購入画面に進めないとき' do
      it '郵便番号が必須であること' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal codeを入力してください", "Postal codeは半角数字で記入してください")
      end

      it '都道府県についての情報が未選択では出品できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefectureを選択してください")
      end

      it '都道府県についての情報が必須であること' do
        @order.prefecture_id = ""
        @order.valid?
          expect(@order.errors.full_messages).to include("Prefectureを入力してください", "Prefectureを選択してください")
      end

      it '市区町村の情報が必須であること' do
        @order.city = ""
        @order.valid?
          expect(@order.errors.full_messages).to include("Cityを入力してください","Cityはひらがなカタカナ漢字を記入してください")
      end

      it '番地についての情報が必須であること' do
        @order.house_number = ""
        @order.valid?
          expect(@order.errors.full_messages).to include("House numberを入力してください")
      end

      it '電話番号についての情報が必須であること' do
        @order.phone_number = ""
        @order.valid?
          expect(@order.errors.full_messages).to include("Phone numberを入力してください", "Phone numberは半角数字で記入してください")
      end

      it '商品名が必須であること' do
        @item.name = ""
        @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください", "商品名はひらがなカタカナ漢字を記入してください")
      end

      it "tokenが空では登録できないこと" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end