class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def search
    @model = params[:model]
    @keyword = params[:keyword]
    
    # 選択したモデルに応じて検索を実行
    if @model == "user"
      @results = User.search(@keyword)
    else
      @results = Item.search(@keyword)
    end
  end
end