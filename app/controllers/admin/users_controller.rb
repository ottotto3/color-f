class Admin::UsersController < ApplicationController
  def index
    if params[:search].present?
      search_users = User.select { |user| user.name.include?(params[:search]) }
      @users = Kaminari.paginate_array(search_users).page(params[:page])
      @heading = "「#{params[:search]}」の検索結果"
    else
      @users = User.page(params[:page]).per(8)
      @heading = "会員一覧"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :info, :profile_image, :color, :is_active)
  end
  
end
