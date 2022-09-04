class Public::SearchsController < ApplicationController
   before_action :authenticate_customer!

  def show
    @range = params[:range]
     @posts = Post.where("name LIKE?","%#{params[:word]}%")
        @genres = Genre.where("title LIKE?","%#{params[:word]}%")
  end
end
