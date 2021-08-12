Rails.application.routes.draw do
  namespace :api do
    
    resources :words

    mount_devise_token_auth_for 'User', at: 'auth',  controllers: {
      registrations: 'api/auth/registrations' }

  end
end
