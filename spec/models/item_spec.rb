require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく時' do
      it '商品画像、商品名、商品説明・状態、カテゴリーの情報、配送料、発送元、発送までの日数、販売価格があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかない時' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '商品の状態が空では登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品のカテゴリー情報が空では登録できない' do
        @item.tag = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Tag can't be blank")
      end
      it '商品の配送料が空では登録できない' do
        @item.charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '商品の発送元が空では登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @item.order_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Order date can't be blank")
      end
      it '販売価格が空では登録できない' do
        @item.charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '販売価格は半角数字でないと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が半角英数混合では登録できない' do
        @item.price = '500yen'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が半角英語だけでは登録できない' do
        @item.price = 'yen'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it '価格が10,000,000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'プルダウンで 1 が選択されていると登録できない(状態)' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'プルダウンで 1 が選択されていると登録できない（カテゴリー）' do
        @item.tag_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Tag must be other than 1")
      end
      it 'プルダウンで 1 が選択されていると登録できない（配送料）' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end
      it 'プルダウンで 1 が選択されていると登録できない（発送元）' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'プルダウンで 1 が選択されていると登録できない（発送日数）' do
        @item.order_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Order date must be other than 1")
      end
    end
  end
end

