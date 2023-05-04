Rails.application.routes.draw do
  resources :user_profiles
  resources :fantasies
  resources :earns
  resources :withdraws
  resources :rewards
  resources :accounts
  resources :app_opens
  resources :users
  resources :task_offers
  resources :play_earns
  resources :matches
  resources :players
  resources :teams
  
  mount Cricket::Base => '/'
  get 'dashboard/index'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "matches#index"
end
