# frozen_string_literal: true

Rails.application.routes.draw do
  get 'searches/index'
  # Create privacy page for facebook oauth
  get '/privacy', to: 'pages#privacy'

  get '/search', to: 'searches#index', as: :search

  devise_scope :user do
    authenticated :user do
      root 'answers#home', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#landing', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :employment, except: [:index]
  end

  get '/bookmarks', to: 'answers#bookmark_list', as: :bookmark
  get '/home', to: 'answers#home', as: :home

  resources :questions do
      get "tagged", on: :collection, as: "tagged"
    resources :answers do
      member do
        put 'like', to: 'answers#upvote'
        put 'dislike', to: 'answers#downvote'
      end

      put '/bookmark', to: 'answers#toggle_bookmark', on: :member

      # put :bookmark_answer, on: :member
      # put '/dismiss_article', to: 'answers#dismiss_article', on: :member
    end
  end

  resources :profiles, only: [:show] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
