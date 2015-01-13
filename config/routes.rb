Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products do
    resources :reviews, only: [:create, :destroy]
  end

  resources :categories
end
