class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :description, :state_id, :delivery_burden_id, :prefecture_id, :ship_day_id, :price, :category_id, :image).merge(user_id: current_user.id)
  end

end
