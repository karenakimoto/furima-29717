require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての記入欄に正式な値があれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空だとが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'detailsが空の場合登録できない' do
      @item.details = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end

    it 'category_idが1だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'condition_idが1だと登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it 'deliveryfee_idが1だと登録できない' do
      @item.deliveryfee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Deliveryfee must be other than 1')
    end

    it 'prefectures_idが1だと登録できない' do
      @item.prefectures_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefectures must be other than 1')
    end

    it 'days_idが1だと登録できない' do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days must be other than 1')
    end

    it 'priceが空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満の場合登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが10000000異常の場合登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが半角数字以外の場合登録できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
