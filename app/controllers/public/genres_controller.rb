class Public::GenresController < ApplicationController
  # before_action :authenticate_customer
 def index
  @genres = Genre.all
 end

 def create
  @post = Post.new
  @genres = current_customer.genres.new(genre_params)
  @genres.save
 end
 
def by_own_index
 @genres = Genre.where(customer_id: current_customer.id)
end

def destroy
  @genre= Genre.where(id:params[:id],customer_id: current_customer.id).first
  @genre.destroy
  redirect_to public_genres_by_own_index_path
end

 private

 def genre_params
   { name: params[:name] }
  # params.permit(:name)
 end
end
