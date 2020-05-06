# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'questions#index'
  # get 'pages/index'
  devise_for :users

  resources :users

  resources :questions do
    resources :answers
  end

  resources :profiles, only: [:show]

  resources :employment, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
