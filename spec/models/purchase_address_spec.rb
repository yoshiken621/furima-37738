require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
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
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'post_codeがないと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと購入できない' do
        @purchase_address.post_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'post_codeが3桁ハイフン4桁でないと購入できない' do
        @purchase_address.post_code = '11-11111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'post_codeが半角文字列でないと購入できない' do
        @purchase_address.post_code = '１１１ー１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが未選択だと購入できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'city_townがないと購入できない' do
        @purchase_address.city_town = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City town can't be blank")
      end

      it 'addressがないと購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberがないと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上でないと購入できない' do
        @purchase_address.phone_number = '999999999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberが11桁以内でないと購入できない' do
        @purchase_address.phone_number = '999999999999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberが半角数値でないと購入できない' do
        @purchase_address.phone_number = 'ああああああああああ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'user_idが空だと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
