# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  resources :comments, only: %i[show create] do
    member do
      get :ratings
    end
  end
  resources :categories, only: [:index]
  resources :articles do
    member do
      get :rollback
      get :versions
    end
  end
  resources :users, only: %i[show update]
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  mount Sidekiq::Web => '/sidekiq'
end
