# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :super_admin do
    resources :registries do
      post "sort_values", on: :collection
      get "download"
    end
    resources :registry_values, only: %i[new create edit update destroy]
  end

  resources :registries, only: [] do
    get "load_values", action: :load_values, on: :collection
  end
  namespace :paginable do
    # Paginable actions for registries
    resources :registries, only: [] do
      get "index/:page", action: :index, on: :collection, as: :index
    end
  end
end
