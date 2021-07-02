class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

    if user_signed_in?
      if @item.order_present?
        redirect_to root_path
      end
    end

  end

  private
  def order_params
    params.require(:order_address)
          .permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
