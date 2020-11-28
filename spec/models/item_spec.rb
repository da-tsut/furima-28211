require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'アイテム新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'ログインしているユーザーだけが、出品ページへ遷移できること' do
      it 'ユーザー全ての情報と合致すれば出品できる' do
          expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
     it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を添付してください")
     end

     it '商品名が必須であること' do
      @item.name = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください", "商品名はひらがなカタカナ漢字を記入してください")
     end

     it '商品の説明が必須であること' do
      @item.introduction = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください", "商品の説明はひらがなカタカナ漢字を記入してください")
     end

     it 'カテゴリーの情報が未選択では出品できないこと' do
      @item.category_id = 1
      @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
     end

     it 'カテゴリーの情報が必須であること' do
      @item.category_id = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
     end

     it '商品の状態についての情報が未選択では出品できないこと' do
      @item.item_condition_id = 1
      @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
     end

     it '商品の状態についての情報が必須であること' do
      @item.item_condition_id = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
     end

     it '配送料の負担についての情報が未選択では出品できないこと' do
      @item.postage_payer_id = 1
      @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
     end

     it '配送料の負担についての情報が必須であること' do
      @item.postage_payer_id = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
     end

     it '発送元の地域についての情報が未選択では出品できないこと' do
      @item.prefecture_id = 1
      @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
     end

     it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
     end
     
     it '発送までの日数についての情報が未選択では出品できないこと' do
      @item.day_to_ship_id = 1
      @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
     end

     it '発送までの日数についての情報が必須であること' do
      @item.day_to_ship_id = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
     end

     it '価格についての情報が必須であること' do
      @item.price = ""
      @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
     end

     it "価格の範囲は、¥300以下は登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は¥300以上で入力してください")
    end

    it "価格の範囲は、¥10,000,000以上は登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は¥9,999,999以下で入力してください")
    end

     it "販売価格は半角数字のみ保存可能であること" do
       @item.price = "４００"
       @item.valid?
       expect(@item.errors.full_messages).to include("価格は半角数字で記入してください")
     end   
   end
  end
end