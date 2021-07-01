class OrdersController < ApplicationController
  before_action :sold_out_item, only: [:show]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new

  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address)
          .permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end

  def pay_item
    Payjp.api_key = "sk_test_97eecc9f7c34ab66a476436a"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
