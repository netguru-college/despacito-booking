Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :rooms
  resources :cars
  resources :bookings
  resources :resources

end
