module UsersHelper
  # def authenticated?
  #   session[:oauth_token]
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def token_as_hash(token)
  #   { token: token.token,
  #     refresh_token: token.refresh_token,
  #     expires_at: token.expires_at }
  # end
end