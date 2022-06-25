Rails.application.routes.draw do
  resources :friendships
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/users/sign_in')
end
