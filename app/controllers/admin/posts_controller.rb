class Admin::PostsController < ApplicationController
 def new
    @post = Post.new
 end

 def index
    @posts = Post.all
    @user = current_customer
    @post = Post.new
 end

 def show
    @post=Post.find(params[:id])
 end

 def edit
     @post=Post.find(params[:id])
 end

 def update
    @post=Post.find(params[:id])
    @post.update!(post_params)
    redirect_to  admin_post_path(params[:id])
 end

 def destroy
 end

 private
 def post_params
    params.require(:post).permit(:title, :body)
 end

end
