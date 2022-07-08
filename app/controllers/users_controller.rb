class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      bypass_sign_in(@user)

      else
        render 'edit'
      end
   end


  def listing
    @user = User.find(params[:id])
  end



  def favorites
    @user=User.find_by(id:params[:id])
    @favorites=Favorite.where(user_id: @user.id)
  end


  private
    def user_params
    params.require(:user).permit(:password,:first_name,:first_name_kana,:last_name_kana,:last_name,:email)
    end
end
