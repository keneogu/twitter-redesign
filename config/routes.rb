Rails.application.routes.draw do
  resources :tweets
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index,:new,:create,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
