Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/my_events', to: 'events#my_events', as: 'my_events'

  # Defines the root path route ("/")
  # root "posts#index"
  resources :events do
    resources :tickets, only: %i[new create]
    resources :orders, only: %i[new create]
  end

  resources :tickets, only: %i[index]
  resources :orders, only: %i[index]
  patch "orders", to: "orders#checkout", as: 'checkout'
end
