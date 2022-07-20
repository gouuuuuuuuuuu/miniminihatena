class Admin::GenresController < ApplicationController

 def index
  @genres = Genre.all
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

 private

 def genre_params
  params.require(:genre).permit(:name)
 end

end
