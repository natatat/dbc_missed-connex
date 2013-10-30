class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Signed in!"
  end

  # def auth
  #   user = request.env['omniauth.auth'].info
  #   session[:user] = user
  #   token = request.env['omniauth.auth'].credentials
  #   session[:oauth_token] = token_as_hash(token)
  #   redirect_to root_path
  # end

  def destroy
    session.clear
    redirect_to root_path, :notice => "Signed out!"
  end
end