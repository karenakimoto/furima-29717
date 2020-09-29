require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての記入欄に正式な値があれば登録できる' do
      expect(@order_address).to be_valid
    end

    it 'postal_codeが空の場合登録できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end

    it 'postsl_codeにハイフンが含まれない場合登録できない' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefectures_idが1だと登録できない' do
      @order_address.prefectures_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefectures must be other than 1')
    end

    it 'cityが空の場合登録できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空の場合登録できない' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phonenumberが空の場合登録できない' do
      @order_address.phonenumber = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phonenumber can't be blank", 'Phonenumber is invalid')
    end

    it 'phonenumberにハイフンが含まれている場合登録できない' do
      @order_address.phonenumber = '090-8759-2289'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phonenumber is invalid')
    end

    it 'phonenumberが11桁以外の場合登録できない' do
      @order_address.phonenumber = '111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phonenumber is invalid')
    end
  end
end
