class CategoriesController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.create(params[:category])
    redirect_to root_path if @category.save
  end

  def show
    @post = Post.new
    @category = Category.find(params[:id])
  end

end