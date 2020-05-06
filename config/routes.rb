# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/index'

  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
