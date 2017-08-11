class PostsController < ApplicationController

  # before_action :authenticate_user!, only: [:new, :edit]
  # before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!

  def index
    news_url = "https://newsapi.org/v1/articles?source=breitbart-news&sortBy=latest&apiKey=07556454b6b94e00b7630880dae6a93c"
    # news_url = "https://newsapi.org/v1/articles?source=abc-news-au&sortBy=top&apiKey=07556454b6b94e00b7630880dae6a93c"
    response = HTTParty.get(news_url)
    @news_data = response
    # render json: response[:articles]
    @all_posts = current_user.posts
    @new_post = current_user.posts.new

    # render html: "show all post by #{current_user.name}"
    # meme_url = "https://simple-weather.p.mashape.com/aqi/endpoint?mashape-key=Vdnjg20hGNmshJHvnoKhVcw3BXlDp1aKT4RjsnawLMmSK6RCfs"
    # response = HTTParty.get(meme_url)
    # render json: response
  end

  def create
    # render json: params
    creating_post = params.require(:post).permit(:title, :content, :user_id)
    Post.create(creating_post)
    redirect_to posts_path
  end

  def show
    render html: 'show one post'
  end

  def new
    render html: 'show form to create new post'
  end

  def edit
    @current_post = Post.find(params[:id])
  end

  def update
    updated_post = Post.find(params[:id])
    updated_post.update(post_update_params)
    redirect_to posts_path if updated_post.save
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def post_update_params
    params.require(:post).permit(:title, :content)
  end
end
