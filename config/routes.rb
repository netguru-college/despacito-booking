Rails.application.routes.draw do
  root 'resources#index'
  devise_for :users
  resources :bookings do
    resources :payments do
      get 'download_receipt', on: :member
    end
  end

  resources :rooms
  resources :cars
  resources :resources
end
