class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def index
    @posts = Post.all
    render :index
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
