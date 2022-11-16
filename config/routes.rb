require 'sidekiq/web'

Rails.application.routes.draw do
  resources :comments, only: [:show, :create, :update] do
    member {
      post :ratings
    }
  end
  resources :categories, only: [:index]
  resources :articles
  resources :users, only: [:show, :update]
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
