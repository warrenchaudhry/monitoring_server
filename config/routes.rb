Rails.application.routes.draw do
  root to: "servers#index"
  resources :servers
  namespace :api do
    namespace :v1 do
      resources :metrics, only: [:create]
    end
  end
  mount ActionCable.server => '/cable'
end
