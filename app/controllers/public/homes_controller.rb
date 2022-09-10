class Public::HomesController < ApplicationController
  def top
    if params[:genre_id].nil?
      @posts = Post.all.order(created_at:"desc")
    else
       #binding.pry
    post_ids = PostGenre.where(genre_id: params[:genre_id]).pluck(:post_id)
@posts = Post.where(id: post_ids)
    end
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp')
    @genres = Genre.all
    gon.weather_api_key = ENV['WEATHER_API_KEY']
  end

  def about
  end
end
