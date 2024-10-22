# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
Rails.application.routes.draw do

  resources :users, only: [:index] do
    member do
      get "edit_role"        # Ruta para que el administrador vea el formulario para editar el rol
      patch "update_role"    # Ruta para que el administrador actualice el rol
    end
  end

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
