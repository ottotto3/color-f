class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    item = Item.find(params[:item_id])
    post = current_user.post.new(post_params)
    post.item_id = item.id
    post.save
    redirect_to posts_path
  end
  
  def index
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:item, :introduction, :star, :color)
  end
end
