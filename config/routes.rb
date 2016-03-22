Rails.application.routes.draw do
  devise_for :users
  resources :articles do
      collection do
      get 'explanation'
    end
  end
  resources :tweets
  resources :comments, only: :create

  resources :users, only: [:show, :edit, :update]
  root 'articles#index'
end
