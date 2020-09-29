class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only: [:index, :create]
  before_action :order_block, only: :index


  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :city, :address, :building, :phonenumber).merge(user_id: current_user.id,item_id: params[:item_id], token:params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_bdfc735e2b960a9beded14aa"  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'                 
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_block
    if @item.order.present?
      redirect_to root_path
    elsif user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    end
  end
end
