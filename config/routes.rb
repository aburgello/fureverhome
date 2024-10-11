Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'about', to: 'about#index'
  get 'testimonials', to: 'testimonials#index', as: 'testimonials'
  get 'landing', to: 'landing#index'
  root 'landing#index'

  get '/my_pets', to: 'pets#my_pets', as: 'my_pets'
  get 'requests', to: 'requests#index'

  resources :pets do
    resources :adoptions, only: [:new, :create, :destroy] do
      member do
        patch :accept
      end
    end
  end
  resources :requests, only: [:index, :create]

  resources :adoptions do
    resources :messages, only: [:index, :create]
  end
end
