Rails.application.routes.draw do
  devise_for :users
  root to: 'watches#index'
  get 'my-watches', to: 'pages#my_watches', as: :my_watches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watches do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:destroy]
end
