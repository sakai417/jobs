Rails.application.routes.draw do
  devise_for :users
  resources :articles
  #   collection do
  #     get 'success'
  #   end
  # end
  resources :users, only: [:show]
  root 'articles#index'
end
