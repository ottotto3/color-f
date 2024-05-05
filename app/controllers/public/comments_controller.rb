class Public::CommentsController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def require_login
    unless logged_in?
    flash[:alert] = "ご利用にはログインが必要です"
    render 'public/sessions/new', layout: 'application'
    end
  end

end
