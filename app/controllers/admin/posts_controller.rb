class Admin::PostsController < ApplicationController
  before_action :authenticate_customer

 def index
   @customer = Customer.find(params[:customer_id])
   @posts = @customer.posts
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
   customer_id = @post.customer_id
   @post.destroy
   redirect_to admin_posts_path(customer_id:customer_id)
 end

 private
 def post_params
    params.require(:post).permit(:title, :body, genre_ids: [])
 end
end
