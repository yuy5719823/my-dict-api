Rails.application.routes.draw do
  namespace :api do
    
    resources :words, only: [:index, :create, :update, :destroy]
    get '/words/archive', to: 'words#archive_index'

    mount_devise_token_auth_for 'User', at: 'auth',  controllers: {
      registrations: 'api/auth/registrations' }

  end
end
