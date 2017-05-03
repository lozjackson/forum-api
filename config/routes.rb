Rails.application.routes.draw do
  get '/users/current-user', to: "current_user#show"
  resources :users
  resources :posts
  resources :topics
  post '/login', to: "sessions#create"
  post '/token-refresh', to: "sessions#refresh"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
