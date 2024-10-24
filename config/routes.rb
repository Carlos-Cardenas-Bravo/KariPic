# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
Rails.application.routes.draw do
  root "photos#index"
  devise_for :users
  resources :users, only: [:index]

  resources :photos do
    resources :comments, only: [:create, :new, :edit, :update, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets
