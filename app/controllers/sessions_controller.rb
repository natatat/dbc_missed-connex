class SessionsController < ApplicationController
  # use OmniAuth::Builder do
  #   provider :dbc, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']
  # end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.password == params[:user][:password]
      session[:current_user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "username and password not found."
      redirect_to root_path
    end
  end
  def destroy
    session.clear
    redirect_to root_path
  end
end