Billtastic::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :vendors
  resources :quickbooks do
    collection do
      get :authenticate
      get :oauth_callback
      get :disconnect
    end
  end
  root to: 'vendors#index' 
end
