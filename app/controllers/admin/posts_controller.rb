class Admin::PostsController < ApplicationController
 def index
    @posts = Post.where(customer_id: params[:customer_id])
    #@post = Post.new
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
  @post= Post.find(params[:id])
  @post.destroy
  redirect_to admin_posts_path
 end

 private
 def post_params
    params.require(:post).permit(:title, :body)
 end

end
