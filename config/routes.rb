Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  get 'articles/new'
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
end