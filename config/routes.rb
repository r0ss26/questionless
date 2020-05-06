# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'questions#index', as: 'root'
  resources :questions do
    resources :answers
  end
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
