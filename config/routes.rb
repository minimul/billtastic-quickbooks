Billtastic::Application.routes.draw do
  resources :vendors
  resources :quickbooks do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end
end
