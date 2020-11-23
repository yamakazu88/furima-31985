require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context "出品がうまく行くとき" do
      it "全ての項目が存在すれば、保存できる" do
        expect(@item).to be_valid
      end

      it "priceが300円以上だと保存できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end

      it "priceが9,999,999円以下だと保存できる" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end
    

    it "imageが空だと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空だと保存できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "textが空だと保存できない" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "genre_idが1だと保存できない" do
      @item.genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre must be other than 1")
    end

    it "status_idが1だと保存できない" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "charge_idが1だと保存できない" do
      @item.charge_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge must be other than 1")
    end

    it "prefecture_idが1だと保存できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "day_idが1だと保存できない" do
      @item.day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end

    it "priceが空だと保存できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが299円以下だと保存できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが10,000,000円以上だと保存できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが全角数字だと保存できない" do
      @item.price = "１２３４５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "userが紐づいていないと保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
