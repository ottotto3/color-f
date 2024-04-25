class Public::SearchesController < ApplicationController
  def search
    @model = params[:model]
    @keyword = params[:keyword]
    
    # 選択したモデルに応じて検索を実行
    if @model == "item"
      @results = Item.search(@keyword)
    else
      @posts = Post.tag_search(@keyword)
      @comment = Comment.new
    end
  end
end
