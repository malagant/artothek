Artothek::Application.routes.draw do

  devise_for :users

  resources :users do
    resources :albums do
      resources :tracks
    end
    resources :artists do
      resources :albums
    end
  end

  resources :albums do
    resources :tracks
  end

  resources :users, :controller => "users/registrations", :only => [ :index ]

  get "home/index"

  root :to => 'home#index'
end
