Rails.application.routes.draw do

  resources :channel_subscriptions
  resources :messages
  mount ActionCable.server => '/cable'
  
  resources :videos
  resources :channels
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
