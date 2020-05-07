# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root 'questions#index', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#landing', as: :unauthenticated_root
    end
  end
  get '/pages/landing', to: 'pages#landing'
  get '/pages/login', to: 'pages#login', as: 'login'
  get '/pages/email_sign_up', to: 'pages#email_sign_up', as: 'email_sign_up'

  devise_for :users

  resources :users do
    resources :employment, except: [:index]
  end

  resources :questions do
    resources :answers
  end

  resources :profiles, only: [:show] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
