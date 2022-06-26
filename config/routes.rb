Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  get 'articles/new'
  root to: "items#index"
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
  end
end