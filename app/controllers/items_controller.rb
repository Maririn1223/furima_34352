class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :create]


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
      render:new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render:edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :tag_id, :condition_id, :charge_id, :prefecture_id, :order_date_id, :price).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
  
end
