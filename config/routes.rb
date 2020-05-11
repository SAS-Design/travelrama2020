# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games, only: %w[index create show]

  # Error routes
  namespace :errors do
    get 'unauthorized'
    get 'forbidden'
    get 'not_found'
    get 'rejected'
    get 'internal_server_error'
  end

  root to: 'games#index'
end
