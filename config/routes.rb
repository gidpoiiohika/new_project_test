require 'sidekiq/web'

Rails.application.routes.draw do
  resources :comments
  get 'categories/index'
  resources :articles
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
