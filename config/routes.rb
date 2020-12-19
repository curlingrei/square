Rails.application.routes.draw do
  get 'booklikes/create'
  get 'booklikes/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'toppages/index'
  root 'toppages#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # for guest_user
  post 'guest_login', to: 'guest_login#create'
  resources :users
  resources :bookposts do
    resources :booklikes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
