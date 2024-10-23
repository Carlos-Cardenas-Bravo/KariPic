# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index]

  resources :photos do
    resources :comments, only: [:create, :new, :edit, :update, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "photos#index"
end

# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets
