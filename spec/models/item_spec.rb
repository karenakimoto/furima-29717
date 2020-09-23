require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての記入欄に正式な値があれば登録できる'do
      expect(@item).to be_valid
    end

    it 'imageが空だとが空だと登録できない'do
      @item.image = nil
      @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと登録できない'do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'detailsが空だと登録できない'do
      @item.details = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end

    it 'categoryが空だと登録できない'do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'conditionが空だと登録できない'do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'deliveryfeeが空だと登録できない'do
      @item.deliveryfee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliveryfee can't be blank")
    end

    it 'prefecturesが空だと登録できない'do
      @item.prefectures = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end

    it 'daysが空だと登録できない'do
      @item.days = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it 'priceが空だと登録できない'do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満の場合登録できない'do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが10000000異常の場合登録できない'do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが半角数字以外の場合登録できない'do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
