class ProductsController < ApplicationController
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name,:description,:category_id,:status_id,:price,:shopping_cost_id,:prefecture_id,:shopping_day_id, :image).merge(user_id: current_user.id)
  end
end
