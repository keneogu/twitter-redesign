Rails.application.routes.draw do
  resources :tweets
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index,:new,:create,:show]

  resources :users, only: %i[show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
