class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchases.new(puchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
