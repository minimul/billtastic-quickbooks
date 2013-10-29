Billtastic::Application.routes.draw do
  resources :vendors do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end
end
