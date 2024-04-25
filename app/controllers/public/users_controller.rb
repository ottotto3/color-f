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
    @user = current_user
    withdrew_email = "withdrew_" + Time.now.to_i.to_s + @user.email
    @user.update(email: withdrew_email, is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :info, :profile_image, :color)
  end
end
