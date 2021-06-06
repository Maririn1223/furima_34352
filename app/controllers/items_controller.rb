class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :tag_id, :condition_id, :charge_id, :prefecture_id, :order_date_id, :price)
  end
end
