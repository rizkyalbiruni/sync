Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :games, only: [:show, :create] do
    member do
      post :guess
      post :next_guess
  end
end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :groups, only: [:create, :destroy] do
    resources :games, only: [:create]
  end
  resources :games, only: [:show] do
    resources :set_dials, only: [:new, :create]
  end
  resources :group_subscriptions, only: [:create]
  # Defines the root path route ("/")
  # root "posts#index"

  resources :topics, only: [:show] do
    resources :set_dials, only: [:new, :create] do
      resources :dial_guesses, only: [:new, :create]
    end
  end

resources :set_dials, only: [] do
  resources :dial_guesses, only: [:new, :create]
end

end
