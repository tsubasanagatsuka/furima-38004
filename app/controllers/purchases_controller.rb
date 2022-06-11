class PurchasesController < ApplicationController
  def index
    @purchase_my_address = PurchaseMyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_my_address = PurchaseMyAddress.new(purchase_params)
    if @purchase_my_address.valid?
      @purchase_my_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_my_address).permit(:postcode, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
