# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, path: :auth
  resources :users, only: %i[show edit]

  resources :experiences
  resources :user_experiences
end
