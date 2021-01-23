require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @address = FactoryBot.build(:address)
  end
  describe "商品購入" do
    context "購入失敗時" do
      it "トークンが空だと購入できない" do
        @address =
        @address.valid?
        expect(@address.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "郵便番号が空だと購入できない" do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank") 
      end
      it "都道府県が空だと購入できない" do
        @address.region_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Region must be other than 1") 
      end
      it "市区町村が空だと購入できない" do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("city can't be blank") 
      end
      it "番地が空だと購入できない" do
        @address.area = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank") 
      end
      it "電話番号が空だと購入できない" do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank") 
      end
      it "郵便番号にハイフンが入ってないと購入できない" do
        @address = 1111122
        @address.valid?
        expect(@address.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "電話番号にハイフンが入っていると購入できない" do
        @address = 090-1111-22
        @address.valid?
        expect(@address.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "電話番号の桁数が足りないと購入できない" do
        @address = 090222211
        @address.valid?
        expect(@address.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "トークンが空だと購入できない" do
        @address =
        @address.valid?
        expect(@address.errors.full_messages).to include("Nickname can't be blank") 
      end
    end
    context "購入成功時" do
      
    end
  end  
end
