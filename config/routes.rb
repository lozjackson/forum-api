Rails.application.routes.draw do
  resources :users, :roles, :posts, :topics
  post '/login', to: "sessions#create"
  post '/token-refresh', to: "sessions#refresh"
  put '/users/:id/change-password', to: "users#change_password"
  put '/users/:id/add-role', to: "users#add_role"
  put '/users/:id/remove-role', to: "users#remove_role"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
