module AuthorizationSpecHelper
  def sign_in(user)
    post api_user_session_path, params: { email: user.email, password: user.password }
    
    response.headers.slice('client', 'access-token', 'uid')
  end
end
