Rails.application.routes.draw do
  resources :comments
  root 'users#index'

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  resources :friendships, only: [:create, :update, :destroy]

  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end
  
  resources :post_likings, only: [:create, :destroy]

  get 'notifications' => 'notifications#index'
  delete 'destroy_notifications' => 'notifications#destroy_all'

  resources :users, only: [:index] do
    get 'show', :as => :profile
    get 'friends'
    get 'received_requests'
    get 'sent_requests'
    get 'post'
  end

  # get 'users/all' => 'users#index', :as => :users_index
  # get 'users/:user_id/profile' => 'users#show', :as => :users_profile
  # get 'users/:user_id/friends' => 'users#friends', :as => :users_friends
  # get 'users/:user_id/received_requests' => 'users#received_requests', :as => :users_received_requests
  # get 'users/:user_id/sent_requests' => 'users#sent_requests', :as => :users_sent_requests
end
