# frozen_string_literal: true

Rails.application.routes.draw do
  # Create privacy page for facebook oauth
  get "/privacy", to: 'pages#privacy'

  devise_scope :user do
    authenticated :user do
      root 'questions#index', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#landing', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

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
