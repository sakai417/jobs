Rails.application.routes.draw do
  resources :articles, only: [:index, :new, :create]
  root 'articles#index'
end
