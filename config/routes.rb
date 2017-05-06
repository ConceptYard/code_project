Rails.application.routes.draw do

  concern :commentable do
    resources :comments
  end

  resources :posts, concern: :commentable

  root to: 'posts#index'

  devise_for :users
  resources :users
end
