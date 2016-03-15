Rails.application.routes.draw do
  resources :articles, only: [:index, :new, :create, :destroy]
  root 'articles#index'
end
