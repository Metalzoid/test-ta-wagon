Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :games, only: %i[create show update] do
    resources :parties, only: %i[create update] do
      resources :solutions, only: %i[create update destroy]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
