Rails.application.routes.draw do
  root 'compositions#index'
  resources :compositions
  resources :tags, only: [:show]
end
