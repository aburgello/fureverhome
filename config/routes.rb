Rails.application.routes.draw do
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root and landing page routes
  get 'landing', to: 'landing#index'
  root 'landing#index'

  # My Pets route outside the resources block
  get '/my_pets', to: 'pets#my_pets', as: 'my_pets'

  # Pet and adoption resources
  resources :pets do
    resources :adoptions, only: [:new, :create]
  end
end
