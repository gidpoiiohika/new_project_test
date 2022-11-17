require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  resources :comments, only: [:show, :create, :update] do
    member {
      post :ratings
    }
  end
  resources :categories, only: [:index]
  resources :articles do
    member {
      get :rollback
      get :versions
    }
  end
  resources :users, only: [:show, :update]
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  
  mount Sidekiq::Web => '/sidekiq'
end
