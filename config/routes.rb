# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'questions#index'
  # get 'pages/index'
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
