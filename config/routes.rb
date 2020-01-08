Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/login', to: 'sessions#new', as: 'login'
      post '/login', to: 'sessions#create'
      post '/reports', to: 'reports#create'
      resources :users, only: [:index, :show, :update] do
        get "/dogs", to: 'users/dogs#index'
        post "/dogs", to: 'users/dogs#create'
        get "/matches", to: 'users/matches#index'
        post "/matches", to: 'users/matches#create'
      end
      resources :dogs, only: :index do
      end
      resources :dog_images, only: [:index, :show] do
      end
      resources :reports, only: :index do
      end
    end
  end
end
