require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品登録" do
    context "登録失敗時" do
      it "写真が空では登録できない" do
        @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "名前が空では登録できない" do
        @item.name= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "説明文が空では登録できない" do
        @item.exoplanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Exoplanation can't be blank")
      end
      it "カテゴリーidが１では登録できない" do
        @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "状態idが１では登録できない" do
        @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "送料idが１では登録できない" do
        @item.send_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Send fee must be other than 1")
      end
      it "都道府県idが１では登録できない" do
        @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
      end
      it "輸送日idが１では登録できない" do
        @item.wait_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Wait day must be other than 1")
      end
      it "価格が空だと登録できない" do
        @item.value = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Value can't be blank", "Value is not included in the list", "Value is not a number")
      end
      it "価格が範囲内でないと登録できない" do
        @item.value = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Value is not included in the list")
      end
      it "価格が半角数字でないと登録できない" do
        @item.value = "３３３３"
      @item.valid?
      expect(@item.errors.full_messages).to include("Value is not a number")
      end
    end
  end

end
