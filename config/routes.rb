Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'users/profile', to:'users#profile'
  get 'users/profile/edit', to:'users#edit_profile'
  get 'users/account', to:'users#account'
  get 'users/account/edit', to:'users#edit_account'
  patch 'users/profile', to:'users#update_profile'
  patch 'users/account', to:'users#update_account'
  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
