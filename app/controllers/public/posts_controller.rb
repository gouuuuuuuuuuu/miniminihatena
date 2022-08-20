class Public::PostsController < ApplicationController
  def new
    if current_customer.email == 'guest@1111.com'
      redirect_to root_path, alert: 'ゲストユーザーは投稿できません。'
    end
    @post = Post.new
  end

  def index
    @posts = Post.where(customer_id: current_customer.id)
    @post = Post.new
  end

  def show
    @post=Post.find(params[:id])
    @comments = @post.comments
    @comment = current_customer.comments.new
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
  @post= Post.find(params[:id])
  @post.destroy
  redirect_to public_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
