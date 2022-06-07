Rails.application.routes.draw do
  devise_for :users
  root to: 'watches#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watches, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:destroy]
end
