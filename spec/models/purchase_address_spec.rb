require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.2
  end


  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it 'post_code, prefecture_id, city_town, address, building_name, phone_number, user_id, item_idが存在する' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'tokenが存在しないと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tokenを入力してください")
      end
      
      it 'post_codeがないと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeにハイフンがないと購入できない' do
        @purchase_address.post_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号が無効です。 ハイフンを入れてください。')
      end

      it 'post_codeが3桁ハイフン4桁でないと購入できない' do
        @purchase_address.post_code = '11-11111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号が無効です。 ハイフンを入れてください。')
      end

      it 'post_codeが半角文字列でないと購入できない' do
        @purchase_address.post_code = '１１１ー１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号が無効です。 ハイフンを入れてください。')
      end

      it 'prefecture_idが未選択だと購入できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'city_townがないと購入できない' do
        @purchase_address.city_town = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressがないと購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberがないと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberが10桁以上でないと購入できない' do
        @purchase_address.phone_number = '999999999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号が無効です')
      end

      it 'phone_numberが11桁以内でないと購入できない' do
        @purchase_address.phone_number = '999999999999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号が無効です')
      end

      it 'phone_numberが半角数値でないと購入できない' do
        @purchase_address.phone_number = 'ああああああああああ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号が無効です')
      end

      it 'user_idが空だと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("ユーザーIDを入力してください")
      end

      it 'item_idが空だと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("アイテムIDを入力してください")
      end
    end
  end
end
