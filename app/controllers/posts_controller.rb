class PostsController < ApplicationController

  # before_action :authenticate_user!, only: [:new, :edit]

  before_action :authenticate_user!, except: [:index]


  def index
    render json: current_user
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
