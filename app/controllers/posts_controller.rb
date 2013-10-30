class PostsController < ApplicationController

  def index
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
    if @post.save
      redirect_to category_path(@post.category_id)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end