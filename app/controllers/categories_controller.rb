class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    else
      @user = User.new
    end

    @category = Category.new(params[:category])
    if @category.save
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "please enter a valid name"
      redirect_to user_path(@user.id)
    end
  end

  def show
    @category = Category.find(params[:id])
    @post = @category.posts.new
    @posts = Post.where(category_id: @category.id)

    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    else
      @user = User.new
    end
  end

end