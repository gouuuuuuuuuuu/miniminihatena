class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.where(customer_id: current_customer.id)
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
    redirect_to  public_post_path(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to public_posts_path
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
