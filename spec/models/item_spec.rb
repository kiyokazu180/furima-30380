require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品登録" do
    context "登録失敗時" do
      it "画像が空では登録できない" do
        @item.image = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
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
      it "カテゴリーが空では登録できない" do
        @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "状態が空では登録できない" do
        @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "送料が空では登録できない" do
        @item.send_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "都道府県が空では登録できない" do
        @item.region_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "輸送日が空では登録できない" do
        @item.wait_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "値段が空では登録できない" do
        @item.value = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "カテゴリーidが１では登録できない" do
        @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
      it "状態idが１では登録できない" do
        @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
      it "送料idが１では登録できない" do
        @item.send_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
      it "都道府県idが１では登録できない" do
        @item.region = 1
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
      it "輸送日idが１では登録できない" do
        @item.wait_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
      it "価格が範囲内でないと登録できない" do
        @item.value = 200
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
      it "価格が半角数字でないと登録できない" do
        @item.value = "３３３３"
      @item.valid?
      expect(@item.errors.full_messages).to ("")
      end
    end
  end

end
