class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order_address, only: [:index, :create]
  before_action :purchased_confirmation, only: [:index]

  def index
    @order_address = OrderAddress.new
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
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order_address
    @item = Item.find(params[:item_id])
  end

  def purchased_confirmation
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end
end