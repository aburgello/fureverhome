Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get 'landing', to: 'landing#index'
  root 'landing#index'

  get '/my_pets', to: 'pets#my_pets', as: 'my_pets'
  get 'requests', to: 'requests#index'

  resources :pets do
    resources :adoptions, only: [:new, :create, :destroy]
  end
  resources :requests, only: [:index]

  resources :adoptions do
    resources :messages, only: [:index, :create]
  end

end
