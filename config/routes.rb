Rails.application.routes.draw do
  resources :articles, only: :index
  root 'articles#index'
end
