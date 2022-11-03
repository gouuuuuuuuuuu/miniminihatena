class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:show]
  def new
    if current_customer.email == 'guest@1111.com'
      redirect_to root_path, alert: 'ゲストユーザーは投稿できません。'
    end
    @post = Post.new
    @genres = Genre.where(customer_id:[current_customer.id,nil])
  end

  def index
    @posts = Post.where(customer_id: current_customer.id)
    @post = Post.new
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comments = @post.comments
    if customer_signed_in?
      @comment = current_customer.comments.new
    else
      @comment = Comment.new
    end
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
    #params[:post][:genre] ? @post.genre = params[:post][:genre].join(",") : false #・・・②
    if @post.save
      redirect_to public_posts_path(@post.id)
    else
      @genres = Genre.all
      render :new
    end
 end



  def destroy
  @post= Post.find(params[:id])
  @post.destroy
  redirect_to public_posts_path
  end

  private
  def post_params
    { title: params[:post][:title], body: params[:post][:body], post_image: params[:post][:post_image], genre_ids: params[:post][:genre_ids] }
    # params.require(:post).permit(:title, :body, :post_image, genre_ids: [])
  end
  
end
