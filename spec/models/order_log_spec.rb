require 'rails_helper'

RSpec.describe OrderLog, type: :model do
  describe '商品購入機能' do
    before do
      @order_log = FactoryBot.build(:order_log)
    end

    context "購入がうまくいくとき" do
      it "必要な項目とtokenが存在すると保存できる" do
        expect(@order_log).to be_valid
      end

      it "building_nameが空でも保存できる" do
        @order_log.building_name = nil
        expect(@order_log).to be_valid
      end
    end

    context "購入がうまくいかないとき" do
      it "postal_codeが空だと保存できない" do
        @order_log.postal_code = nil
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeはハイフンを含めた8桁でないと保存できない" do
        @order_log.postal_code = "12345678"
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Postal code ハイフン含めた8桁の半角数字で入力してください")
      end

      it "postal_codeが全角数字だと保存できない" do
        @order_log.postal_code = "１２３-４５６７"
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Postal code ハイフン含めた8桁の半角数字で入力してください")
      end

      it "prefectureが1だと保存できない" do
        @order_log.prefecture = 1
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと保存できない" do
        @order_log.city = nil
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空だと保存できない" do
        @order_log.house_number = nil
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("House number can't be blank")
      end

      it "tellが空だと保存できない" do
        @order_log.tell = nil
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Tell can't be blank")
      end

      it "tellは11桁以内でないと保存できない" do
        @order_log.tell = "090123456789"
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Tell ハイフン含めずに11桁以内の半角数字で入力してください")
      end

      it "tellにハイフンを含めると保存できない" do
        @order_log.tell = "090-1234-5678"
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Tell ハイフン含めずに11桁以内の半角数字で入力してください")
      end

      it "tellが全角数字だと保存できない" do
        @order_log.tell = "０９０１２３４５６７８"
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Tell ハイフン含めずに11桁以内の半角数字で入力してください")
      end

      it "tokenが空では登録できないこと" do
        @order_log.token = nil
        @order_log.valid?
        expect(@order_log.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
