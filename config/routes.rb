Rails.application.routes.draw do
  root "users#feed"

  devise_for :users
  
  resources :comments
  #Follow Requests: We want to be able to create (send request), update (accept/reject request), and destroy (cancel request) a follow request
  resources :follow_requests, except: [:index, :show, :new, :edit]
  resources :likes, only: [:create, :destroy]
  resources :photos, except: [:index]

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
