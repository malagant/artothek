Artothek::Application.routes.draw do

  devise_for :users

  resources :users do
    resources :artists
  end
  resources :albums do
    resources :tracks
  end

  resources :users do
    resources :albums
  end

  resources :artists do
    resources :albums
  end
  resources :users, :controller => "users/registrations", :only => [ :index, :show ]

  get "home/index"

  root :to => 'home#index'
end
