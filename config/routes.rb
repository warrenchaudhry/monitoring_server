Rails.application.routes.draw do
  devise_for :users
  root to: "servers#index"
  resources :servers
  resources :settings, only: [:show, :edit, :update]
  namespace :api do
    namespace :v1 do
      resources :metrics, only: [:create]
    end
  end
  mount ActionCable.server => '/cable'
end
