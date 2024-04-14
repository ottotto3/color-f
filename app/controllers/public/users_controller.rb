class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def comfirm
  end
  
  def withdraw
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :info, :profile_image, :color)
  end
end
