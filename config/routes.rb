Rails.application.routes.draw do

  root 'compositions#index'
  resources :compositions, only: [:show, :create,]
  namespace :compositions do
    resource :comments, only: [:create, :destroy]
  end

  resources :tags, only: [:show]
  resources :categories, only: [:show]
  devise_for :users

  namespace :admin do
    resource :compositions
    resources :categories
  end
end
