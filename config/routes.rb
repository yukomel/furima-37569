Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only:[:index, :create, :destroy]
    resources :favorites, only: [:create, :destroy, :index, :show]
  end
end