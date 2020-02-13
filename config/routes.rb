Rails.application.routes.draw do
  
  root to: 'main#home'
  resources :categories
  # resources :follows, only: [:index, :create, :destroy]
  # resources :reviews
  resources :manufacturers, only: [:index, :search, :show] do 
    resources :products, only: [:new, :create]
  end 
  resources :products, only: [:new, :create, :show, :edit, :update] do 
    resources :reviews, only: [:new, :create, :show, :edit, :update]
  end 
  resources :users, only: [:new, :show] do 
    resources :follows, only: [:index]
  end 

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/products/new', to: 'products#create'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  post '/products/:id/reviews/new', to: 'reviews#create'
  post '/users/:user_id/create_follow', to: 'follows#create', as: 'create_follow'
  post '/users/:user_id/unfollow', to: 'follows#unfollow', as: 'unfollow'

  # post '/users/:user_id/unfollow, to: 'follows#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end