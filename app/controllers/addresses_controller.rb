class AddressesController < ApplicationController
  def new
    @item = Item.find(params[:id])
    @address = Address.new
  end  

  def create
    @address = Address.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render :index
    end  
  end
  
  private
    
  def address_params
    params.require(:address).permit(:postal_code, :region_id, :area, :building, :city, :phone_number).merge(token: params[:token])
  end  

  def pay_item
    Payjp.api_key = EVN["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: address_params[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
