# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # root to: 'users#index'
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'users#index'
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:index]
  resources :groups, only: %i[index show new create destroy] do
    resources :expenses, only: %i[index show new create destroy]
  end
end
