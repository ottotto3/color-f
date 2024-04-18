class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    item = Item.find(params[:item_id])
    post = current_user.posts.new(post_params)
    post.item_id = item.id
    post.save
    redirect_to posts_path
  end
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
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
