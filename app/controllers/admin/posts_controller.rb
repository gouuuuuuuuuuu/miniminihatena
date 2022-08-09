class Admin::PostsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

   private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
