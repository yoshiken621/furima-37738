require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it 'item_name, item_detail, item_category_id, item_status_id, deliverly_fee_id, deliverly_day_id, item_price, prefecture_id, imageが存在する' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end

      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end

      it 'item_detailが空では出品できない' do
        @item.item_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品説明文を入力してください"
      end

      it 'item_category_idが1では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品カテゴリーを入力してください"
      end

      it 'item_status_idが1では出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end

      it 'deliverly_fee_idが1では出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送料を入力してください"
      end

      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元を入力してください"
      end

      it 'delivery_day_idが1では出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送日を入力してください"
      end

      it 'item_priceが空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "料金を入力してください"
      end

      it 'item_priceが300以下では出品できない' do
        @item.item_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include '料金は一覧にありません'
      end

      it 'item_priceが9999999以上では出品できない' do
        @item.item_price = 1_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '料金は一覧にありません'
      end

      it 'item_priceが半角数値でないと出品できない' do
        @item.item_price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include '料金は一覧にありません'
      end
    end
  end
end
