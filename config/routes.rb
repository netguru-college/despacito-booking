Rails.application.routes.draw do
  root 'resources#index'

  devise_for :users

  resources :bookings do
    resources :payments
  end
  resources :rooms
  resources :cars
  resources :resources

end
