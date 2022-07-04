require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do

    before do
      @product = FactoryBot.create(:product)
      @user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
    end
  
    context '商品購入がうまくいくとき' do
      it '全ての項目が入力できている' do
        expect(@order_address).to be_valid
      end
       
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
       end

    end
  
    context '商品購入がうまくいかないとき' do
      
      it 'codeが空だと登録できない' do
        @order_address.code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Code can't be blank"
      end
      
      it 'codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Code is invalid. Include hyphen(-)"
      end

      it 'area_idが空だと登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '1を選択している場合登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'municipalityが空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'addressが空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'telephoneが空だと登録できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end

      it '電話番号は、9桁以下では保存できない' do
        @order_address.phone = '19012345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end

      it '電話番号が12桁以上では保存できない' do
        @order_address.phone = '190123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end

      it '電話番号に半角数字以外が含まれている場合は保存できない' do
        @order_address.phone = 'aa漢字カタカナひらがなｶﾀｶﾅ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end

      it 'userが紐付いていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていないと登録できない' do
        @order_address.product_id = nil
        @order_address.valid?
          expect(@order_address.errors.full_messages).to include "Product can't be blank"
      end

      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end

    end
  end
end
  