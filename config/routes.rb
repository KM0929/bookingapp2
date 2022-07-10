Rails.application.routes.draw do
  get 'users/account'
  get 'users/:id/account', to:'users#account', as: 'user_account'
  get 'users/:id/profile', to:'users#profile', as: 'user_profile'
  get 'reservations/index'
  post 'reservations/confirm'
  get 'rooms/index'
  root 'top#index'

  resources :rooms do
    get :search, on: :collection
  end
  resources :rooms, only: [:index, :new, :create, :show]
  
  resources :reservations, only: [:index, :new, :create, :show]
  
  resources :users, only: [:update] 
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end