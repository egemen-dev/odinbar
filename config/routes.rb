Rails.application.routes.draw do
  resources :profiles, only: [:show, :index]
  root 'profiles#index'
  devise_for :users
  resources :friendships

  get 'users/friends' => 'users#friends', :as => :users_friends
  get 'users/received_requests' => 'users#received_requests', :as => :users_received_requests
  get 'users/sent_requests' => 'users#sent_requests', :as => :users_sent_requests

end
