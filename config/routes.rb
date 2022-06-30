Rails.application.routes.draw do
  # resources :profiles, only: [:show, :index]
  root 'users#index'
  devise_for :users
  resources :friendships

  get 'users/all' => 'users#index', :as => :users_index
  get 'users/:id/profile' => 'users#show', :as => :users_profile
  get 'users/:id/friends' => 'users#friends', :as => :users_friends
  get 'users/:id/received_requests' => 'users#received_requests', :as => :users_received_requests
  get 'users/:id/sent_requests' => 'users#sent_requests', :as => :users_sent_requests

end
