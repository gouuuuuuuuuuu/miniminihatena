class Public::LikesController < ApplicationController
   before_action :authenticate_customer!
   before_action :authenticate_gest
  def create
    @like = current_customer.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], customer_id: current_customer.id)
    @like.destroy if @like.present?
    redirect_back(fallback_location: root_path)
  end

  def authenticate_gest
    if current_customer && current_customer.email == 'guest@1111.com'
      redirect_to  root_path
    end
  end
end
