AuthDemo::Application.routes.draw do
  resources :users
  resource :sessions
end
