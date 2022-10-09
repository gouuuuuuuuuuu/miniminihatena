class Admin::GenresController < ApplicationController
  before_action :authenticate_customer
def index
  @genres = Genre.where(customer_id: nil)
end
def by_customer_index
 @genres = Genre.where.not(customer_id: nil)
end

 def edit
  @genre=Genre.find(params[:id])
 end

 def update
  @genres = Genre.find(params[:id])
  @genres.update(genre_params)
  redirect_to admin_genres_path(@genres[:id])
 end

 def create
  @genres = Genre.new(genre_params)
  @genres.save
  redirect_to admin_genres_path(@genres)
 end

 def destroy
  @genre= Genre.find(params[:id])
  @genre.destroy
  
  if params[:mode] == 'genres'
   redirect_to admin_genres_path
  else
   redirect_to admin_genres_by_customer_index_path
  end
 end

 private

 def genre_params
  params.require(:genre).permit(:name)
 end

end
