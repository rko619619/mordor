Rails.application.routes.draw do

  root 'compositions#index'
  resources :compositions do
    resource :comments, only: [:create, :destroy]
  end

  resources :tags, only: [:show]
  resources :categories
  devise_for :users
end
