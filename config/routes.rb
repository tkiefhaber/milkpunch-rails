MilkpunchRails::Application.routes.draw do
  devise_for :users
  resources :milkpunches
  root 'milkpunches#index'
  resources :articles
  resources :stats
end
