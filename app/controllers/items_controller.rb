class ItemsController < ApplicationController

    # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
 
    # if @item.user_id == current_user.id && @item.purchase.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   if @item.user_id == current_user.id
  #     @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :delivery_burden_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
