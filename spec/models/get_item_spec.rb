require 'rails_helper'

RSpec.describe GetItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @get_item = FactoryBot.build(:get_item)
  end
  describe "商品購入" do
    context "購入失敗時" do
      it "トークンが空だと購入できない" do
        @get_item.token = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Token can't be blank") 
      end
      it "ユーザーが空だと購入できない" do
        @get_item.user_id = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("User can't be blank") 
      end
      it "アイテムが空だと購入できない" do
        @get_item.item_id = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Item can't be blank") 
      end
      it "郵便番号が空だと購入できない" do
        @get_item.postal_code = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Postal code can't be blank") 
      end
      it "都道府県が空だと購入できない" do
        @get_item.region_id = 1
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Region must be other than 1") 
      end
      it "市区町村が空だと購入できない" do
        @get_item.city = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("City can't be blank") 
      end
      it "番地が空だと購入できない" do
        @get_item.area = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Area can't be blank") 
      end
      it "電話番号が空だと購入できない" do
        @get_item.phone_number = nil
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Phone number can't be blank") 
      end
      it "郵便番号にハイフンが入ってないと購入できない" do
        @get_item.postal_code = 1112222
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Postal code is invalid") 
      end
      it "電話番号にハイフンが入っていると購入できない" do
        @get_item.phone_number = 1112222-333
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Phone number is invalid") 
      end
      it "電話番号の桁数が足りないと購入できない" do
        @get_item.phone_number = 111222211
        @get_item.valid?
        expect(@get_item.errors.full_messages).to include("Phone number is invalid") 
      end
    end
    context "購入成功時" do
      it "全てが入力されてれば登録できる" do
        expect(@get_item).to be_valid
      end
      it "建物が入力されてなくても登録できる" do
        @get_item.building = nil
        expect(@get_item).to be_valid
      end
    end
  end  
end
