# frozen_string_literal: true

Rails.application.routes.draw do
  get "/", to: "pages#index", as: "root"
  resources :questions
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
