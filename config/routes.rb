Rails.application.routes.draw do
  get "routes/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "health" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Define the root route to point to the routes#index action
  root "routes#index"

  resources :courses do
    resources :videos, only: [ :index, :create ]
  end
  resources :videos, only: [ :show, :update, :destroy ]
end
