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
  resources :users, only: [:show]
  resources :events do
    resources :tickets, only: %i[new create destroy]
    resources :orders, only: %i[new create]
    resources :posts, only: %i[new create destroy] do
      resources :comments, only: %i[new create destroy]
    end
  end

  resources :tickets, only: %i[index update] do
    collection do
      get 'edit_images', to: 'tickets#edit_images'
      patch 'update_images', to: 'tickets#update_images'
    end
  end

  resources :orders, only: %i[index destroy]
  patch "orders", to: "orders#checkout", as: 'checkout'
  post 'create_checkout_session', to: 'orders#create_checkout_session'
  get 'orders/success', to: 'orders#success'
  get 'orders/cancel', to: 'orders#cancel'
end
