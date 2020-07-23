Rails.application.routes.draw do
  resources :profiles
  scope"(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root 'compositions#index'

    resources :compositions do
      resource :comments, only: [:create, :destroy]
    end

    resources  :users do
      resource :compositions, only: [:show, :index]
    end

    resources :tags, only: [:show]
    resources :categories, only: [:show]

    namespace :admin do
      resources :categories, except: [:show]
      resources :users do
        resources :compositions
        resources :profiles
      end
    end

  end
end
