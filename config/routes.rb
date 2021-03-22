Rails.application.routes.draw do
  get 'tweets/index'
  root 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index,:new,:create,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
