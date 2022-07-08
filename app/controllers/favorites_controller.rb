class FavoritesController < ApplicationController

  def index
    @user = current_user
    @favorites=Favorite.where(user_id:@user.id)
  end


  def create
    @favorites = current_user.favorites.create(product_id: params[:product_id])
    redirect_back(fallback_location: root_path)

  end
  
  def destroy
    @favorite = Favorite.find_by(product_id: params[:product_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
