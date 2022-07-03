Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create, :update, :index, :show, :edit, :destroy] do
  end
end