class AddressesController < ApplicationController
  def new
    @item = Item.find(params[:id])
    @address = Address.new
  end  

  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      return redirect_to root_path
    else
      render :index
    end  
  end
  
  private
    
  def address_params
    params.require(:address).permit(:postal_code, :region_id, :area, :building, :city, :phone_number)
  end  
end
