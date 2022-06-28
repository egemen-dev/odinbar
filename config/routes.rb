Rails.application.routes.draw do
  resources :profiles, only: [:show, :index]
  root 'profiles#index'
  devise_for :users
  resources :friendships
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
