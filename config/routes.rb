Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  root to: "items#index"

end