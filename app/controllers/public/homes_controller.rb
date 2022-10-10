class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.order(created_at:"desc").page(params[:page]).per(8)
    if params[:genre_id].present?
       #binding.pry
     post_ids = PostGenre.where(genre_id: params[:genre_id]).pluck(:post_id)
     @posts = @posts.where(id: post_ids)
    end
    if params[:word].present?
      @posts = @posts.where("title LIKE?","%#{params[:word]}%")
    end
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp')
    @genres = Genre.where(customer_id: nil)
    gon.weather_api_key = ENV['WEATHER_API_KEY']
    @count = @posts.count
  end

  def about
  end
end
