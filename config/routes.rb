AuthDemo::Application.routes.draw do
  resource :user
  resource :session
  
  root :to => "sessions#new"
end
