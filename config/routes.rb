MadmpOpidor::Engine.routes.draw do
  namespace :super_admin do
    resources :registries do
      post "sort_values", on: :collection
      get "download"
    end
    resources :registry_values, only: %i[new create edit update destroy]
  end
end
