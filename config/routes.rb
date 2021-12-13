Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
    mount Ckeditor::Engine => '/ckeditor'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    root 'static_pages#home'
    get '/help', to: 'static_pages#help'
    get '/about', to: 'static_pages#about'
    get '/contact', to: 'static_pages#contact'
    get '/signup', to: 'users#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    put '/notifications/:id', to: 'notifications#toggle_viewed', as: 'toggle_viewed'
    post '/notifications_for_user/:id', to: 'notifications#index', as: 'index'
    post '/notifications_for_user/:id/read_all', to: 'notifications#read_all', as: 'read_all'
    resources :users do
      member do
        get :following, :followers
        resources :notifications, only: :destroy
      end
    end
    resources :microposts, only: [:create, :destroy]
    namespace :api do
      resources :microposts, only: [:index, :show], defaults: { format: 'json' }
    end
    resources :relationships, only: [:create, :destroy]
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end
