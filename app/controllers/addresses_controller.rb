class AddressesController < ApplicationController
  def index
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
    params.require(:address).permit(:postal_code, :region_id, :area, :building, :city, :phone_number).merge(token: params[:token], user_id:current_user.id, item_id:@item.id)
  end  

  def pay_item
    Payjp.api_key = EVN["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: address_params[:price],  
      card: address_params[:token],    
      currency: 'jpy'                 
    )
  end

end
