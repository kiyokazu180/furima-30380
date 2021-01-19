class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(strong_method)
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    else  
    end  
  end    