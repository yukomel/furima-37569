require 'rails_helper'
# require 'spree/testing_support/factories'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品出品機能' do
    context '商品出品が出来るとき' do
      it '全ての項目が入力できている' do
        expect(@product).to be_valid
      end
    end
    context '商品出品が出来ないとき' do
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空だと登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end
      it 'priceが空だと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it 'category_idが空だと登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idが空だと登録できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Status can't be blank"
      end
      it 'shopping_cost_idが空だと登録できない' do
        @product.shopping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shopping cost can't be blank"
      end
      it 'prefecture_idが空だと登録できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'shopping_day_idが空だと登録できない' do
        @product.shopping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shopping day can't be blank"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @product.category_id = Category.find_by(name: '---').id
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @product.status_id = Status.find_by(name: '---').id
        @product.valid?
        expect(@product.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @product.shopping_cost_id = ShoppingCost.find_by(name: '---').id
        @product.valid?
        expect(@product.errors.full_messages).to include "Shopping cost can't be blank"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @product.prefecture_id = Prefecture.find_by(name: '---').id
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @product.shopping_day_id = ShoppingDay.find_by(name: '---').id
        @product.valid?
        expect(@product.errors.full_messages).to include "Shopping day can't be blank"
      end
      it '半角数字以外が含まれている場合は出品できない' do
        @product.price = '000aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が300円以下では出品できない' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が9_999_999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'userが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include 'User must exist'
      end
    end
  end
end