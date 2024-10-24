# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
Rails.application.routes.draw do
  root "photos#index"
  resources :users, only: [:index]
  devise_for :users, controllers: {
    passwords: "users/passwords"     # personalizo el restablecimiento de contraseña
  }
  resources :photos do
    resources :comments, only: [:create, :new, :edit, :update, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets
