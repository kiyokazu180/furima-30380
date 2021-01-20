class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.all.order('created_at DESC')
  end

  def destroy

  end
  
  def edit
    @item = Item.find(params[:id])
  end  

  def update
    @item = Item.find(params[:id])
    if @item.update(item_method)
       redirect_to root_path
    else
    end
  end

  def show
    @item = Item.find(params[:id])
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
  
  def item_method
    params.permit(:name, :exoplanation, :category_id, :state_id, :send_fee_id, :region_id, :wait_day_id, :value, :image, :id).merge(user_id:current_user.id)
  end
end

 