class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end

  def destroy
  end
end
