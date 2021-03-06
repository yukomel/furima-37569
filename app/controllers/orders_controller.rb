class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :product_find, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if current_user == @product.user || @product.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:code, :prefecture_id, :city, :address, :building, :phone, :order).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def product_find
    @product = Product.find(params[:product_id])
  end
end
