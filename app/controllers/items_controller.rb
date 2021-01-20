class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_index, only: [:edit, :destroy]
  before_action :move_top_a, only: [:edit, :destroy]
  before_action :move_top_b, only: [:edit, :destroy]




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
    if @item.update(strong_method)
       redirect_to root_path
    else
       render :edit
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

  def move_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end  

  def move_top_a
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def move_top_b
    @item = Item.find(params[:id])
    if user_signed_in? && BuyRecord.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end  

end

 