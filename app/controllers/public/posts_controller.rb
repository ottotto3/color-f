class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    item = Item.find(params[:item_id])
    post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(',')
    post.item_id = item.id
    if post.save
      post.save_tags(tag_list)
      redirect_to posts_path, notice:'投稿が完了しました'
    else
      render :new
    end
  end
  
  def index
    @tag_list = PostTag.all
    if params[:latest]
      @posts = Post.page(params[:page]).latest
    elsif params[:old]
      @posts = Post.page(params[:page]).old
    elsif params[:star_count]
      @posts = Post.page(params[:page]).star_count
    else
      @posts = Post.page(params[:page]).latest
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @tag_list = @post.tags.pluck(:tag_name).join(',')
    @post_tags = @post.tags
  end
  
  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.post_tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(',')
    if @post.update(post_params)
      @post.save_post_tags(tag_list)
      redirect_to post_path
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:item, :introduction, :star, :color)
  end
end
