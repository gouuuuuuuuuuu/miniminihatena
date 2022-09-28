class Public::GenresController < ApplicationController
  # before_action :authenticate_customer
 def index
  @genres = Genre.all
 end

 def create
  # binding.pry
  @genres = Genre.new(genre_params)
  @genres.save
 end

 private

 def genre_params
   { name: params[:name] }
  # params.permit(:name)
 end
end
