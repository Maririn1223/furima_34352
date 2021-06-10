class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    #@items = Item.all
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

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :tag_id, :condition_id, :charge_id, :prefecture_id, :order_date_id, :price).merge(user_id: current_user.id)
  end
end
