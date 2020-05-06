# frozen_string_literal: true

Rails.application.routes.draw do
  resources :questions
  devise_for :users
  # get 'pages/index'

  root to: 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
