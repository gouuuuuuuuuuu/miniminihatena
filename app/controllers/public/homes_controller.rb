class Public::HomesController < ApplicationController
  def top
    if params[:format].nil?
      @posts = Post.all.order(created_at:"desc")
    else
       #binding.pry
      @posts = Post.where(genre_id: params[:format])
    end
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp')
    @genres = Genre.all
  end

  def about
  end
end
