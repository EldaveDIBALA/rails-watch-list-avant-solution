# frozen_string_literal: true

# Création des routes
Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/name'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root 'posts#index'

  # Routes pour les films
  resources :movies

  # Routes pour les listes
  resources :lists do
    # Routes bookmarks intégrées aux listes
    resources :bookmarks, only: %i[create destroy]
  end

  # Routes pour les bookmarks
  # resources :bookmarks, only: %i[index show update]
end
