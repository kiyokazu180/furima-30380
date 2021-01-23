class AddressesController < ApplicationController
  before_action :authenticate_user!,   only: [:index]
  before_action :move_top_a, only: [:index]
  before_action :move_top_b, only: [:index]

  def index
    @item = Item.find(params[:id])
    @address = Address.new
  end  

  def create
    @address = Address.new(address_params)
    @buy_record = BuyRecord.new(buy_params)
    if @address.valid?
      pay_item
      @address.save
      @buy_record.save
      return redirect_to root_path
    else
      render :index
    end  
  end
  
  private
    
  def address_params
    params.require(:address).permit(:postal_code, :region_id, :area, :building, :city, :phone_number).merge(token: params[:token], user_id:current_user.id, item_id:@item.id)
  end  

  def buy_params
    params.require(:buy_record).merge(user_id:current_user.id, item_id:@item.id)
  end

  def move_top_a
    @item = Item.find(params[:id])
    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end  
  end    

  def move_top_b
    @item = Item.find(params[:id])
    if user_signed_in? && BuyRecord.exists?(item_id: @item.id)
      redirect_to root_path
    end  
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
