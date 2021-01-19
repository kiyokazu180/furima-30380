class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(strong_method)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end  
  end  
  

  private
  def strong_method
    params.require(:item).permit(:name, :exoplanation, :category_id, :state_id, :send_fee_id, :region_id, :wait_day_id, :value, :image, :id).merge(user_id:current_user.id)
  end
end

 