class PostsController < ApplicationController

  # before_action :authenticate_user!, only: [:new, :edit]
  # before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!

  def index
    @all_posts = current_user.posts
    # render html: "show all post by #{current_user.name}"
  end

  def show
    render html: 'show one post'
  end

  def new
    render html: 'show form to create new post'
  end

  def edit
    render html: 'show form to edit existing post'
  end

end
