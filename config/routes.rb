Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  resources :bookings do
    resources :payments
  end
end
