Rails.application.routes.draw do

  root 'compositions#index'
  resources :compositions do
    #post 'comments', to: "comments#create"
    resource :comments, only: [:create, :destroy]
  end
  resources :tags, only: [:show]
  devise_for :users
end
