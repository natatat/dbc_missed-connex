class UsersController < ApplicationController
  def index
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    else
      @user = User.new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "invalid username or password"
      redirect_to root_path
    end
  end

  def show
    @categories = Category.all
    @user = User.find(params[:id])
  end
end