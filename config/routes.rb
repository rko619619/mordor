Rails.application.routes.draw do
  scope"(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root 'compositions#index'

    resources :compositions do
      resource :comments, only: [:create, :destroy]
    end

    resources  :users do
      resources :compositions, only: [:index]
    end

    resources :tags, only: [:show]
    resources :categories

  end
end
