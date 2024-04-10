class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.post
  end
  
  def edit
  end
  
  def update
  end
  
  def comfirm
  end
  
  def withdraw
  end
end
