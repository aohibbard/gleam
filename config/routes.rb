Rails.application.routes.draw do
  resources :categories
  resources :follows
  resources :reviews
  resources :manufacturers
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
  post '/products/:id/reviews/new', to: 'reviews#create'

  # nest resources
    # manufacturer > product // user > product
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
