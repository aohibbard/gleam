Rails.application.routes.draw do
  resources :reviews
  resources :manufacturers
  resources :products
  resources :users

  resources :manufacturer, only: [:index, :show] do
    resources :products, only: [:new, :edit, :show]
  end 

  # nest resources
    # manufacturer > product // user > product
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
