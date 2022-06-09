class ItemsController < ApplicationController

    # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :delivery_burden_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

end
