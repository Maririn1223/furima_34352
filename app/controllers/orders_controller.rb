class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private
  def order_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building).merge(item_id: @item.id)
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :tag_id, :condition_id, :charge_id, :prefecture_id, :order_date_id, :price).merge(user_id: current_user.id)
  end

end
