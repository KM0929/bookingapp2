Rails.application.routes.draw do
  resources :rooms, only: [:index, :new, :create, :show]
  resources :reservations, only: [:index, :new, :create, :show]
  
  get 'reservations/index'
  post 'reservations/confirm'
  get 'rooms/index'
  root 'top#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end