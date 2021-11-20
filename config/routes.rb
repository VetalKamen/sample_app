Rails.application.routes.draw do

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
  put '/notifications/:id', to: 'notifications#toggle_action', as: 'toggle_action'
  post '/notifications_for_user/:id', to: 'notifications#toggle_menu_action', as: 'toggle_menu_action'
  resources :users do
    member do
      get :following, :followers, :notifications
      resources :notifications, only: :destroy
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
