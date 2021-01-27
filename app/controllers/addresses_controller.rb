class AddressesController < ApplicationController
  before_action :authenticate_user!,   only: [:index]
  before_action :move_top_a, only: [:index]
  before_action :move_top_b, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @get_item = GetItem.new
  end  

  def create
    @item = Item.find(params[:item_id])
    @get_item = GetItem.new(get_params)
    if @get_item.valid?
      pay_item
      @get_item.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
    
  def get_params
    params.require(:get_item).permit(:postal_code, :region_id, :area, :building, :city, :phone_number).merge(token: params[:token], user_id:current_user.id, item_id:params[:item_id])
  end

  def move_top_a
    @item = Item.find(params[:item_id])
    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def move_top_b
    @item = Item.find(params[:item_id])
    if user_signed_in? && BuyRecord.exists?(item_id: @item.id)
      redirect_to root_path
    end  
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.value,  
      card: get_params[:token],    
      currency: 'jpy'
    )
  end

end
