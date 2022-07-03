class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_product, only: [:show]
  # before_action :move_to_index, only: [:edit]


  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  

  private
  def product_params
    params.require(:product).permit(:name,:description,:category_id,:status_id,:price,:shopping_cost_id,:prefecture_id,:shopping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # def move_to_index
  #   unless user_signed_in? && current_user.id == @product.user.id
  #     redirect_to action: :index
  #   end
  # end
end
