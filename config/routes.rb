Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/login', to: 'sessions#new', as: 'login'
      post '/login/:email', to: 'sessions#create'
      resources :users, only: [:index, :show] do
        get "/dogs", to: 'users/dogs#index'
      end
      resources :dogs, only: :index do
      end
      resources :dog_images, only: [:index, :show] do
      end
    end
  end
end
