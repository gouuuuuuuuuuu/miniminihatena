class Public::LikesController < ApplicationController
  def create
    @like = current_customer.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], customer_id: current_customer.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
