Rails.application.routes.draw do
  resources :tweets
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index,:new,:create,:show]

  resources :users, only: %i[show] do
    member do
      post :followings, :followers
    end
    resources :relationships, only: [:create]
  end

  resources :relationships, only: [:destroy]

  resources :tweets, only: [:index, :create] do
    resources :likes, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
