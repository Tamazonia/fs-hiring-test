Rails.application.routes.draw do
  get 'rooms/index'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :motels, only: [:show, :index] do
    resources :rooms, only: [:show, :index]
  end

  resources :bookings, only: [:index]
end
