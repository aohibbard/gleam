Rails.application.routes.draw do
  
  root to: 'main#home'
  resources :categories
  resources :follows
  # resources :reviews
  resources :manufacturers, only: [:index, :show] do 
    resources :products, only: [:new, :create]
  end 
  resources :products, only: [:new, :create, :show, :edit, :update] do 
    resources :reviews, only: [:new, :create, :show, :edit, :update]
  end 
  resources :users

  # resources :manufacturer, only: [:index, :show] do
  #   resources :products, only: [:new, :create, :show, :edit, :update]
  # end 

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/products/new', to: 'products#create'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  post '/products/:id/reviews/new', to: 'reviews#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
