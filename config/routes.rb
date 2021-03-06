Rails.application.routes.draw do
  # get 'groupcommentlikes/create'
  # get 'groupcommentlikes/destroy'
  # get 'groupcomments/create'
  # get 'groupcomments/destroy'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'toppages/index'
  root 'toppages#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # for guest_user
  post 'guest_login', to: 'guest_login#create'
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :bookposts do
    resources :booklikes, only: [:create, :destroy]
    resources :bookcomments, only: [:create, :destroy] do
      resources :commentlikes, only: [:create, :destroy]
    end
  end
  resources :booklikes, only: [:create, :destroy]
  resources :groups do
    resources :participates, only: [:create, :destroy]
    resources :groupcomments, only: [:create, :destroy] do
      resources :groupcommentlikes, only: [:create, :destroy]
    end
  end
  get 'readings', to: 'groups#readings'
  get 'studying_high', to: 'groups#studying_high'
  get 'studying_univ', to: 'groups#studying_univ'
  get 'studying_language', to: 'groups#studying_language'
  get 'studying_exam', to: 'groups#studying_exam'
  get 'programing', to: 'groups#programing'
  get 'mybookposts', to: 'users#show'
  get 'mygroups', to: 'users#mygroups'
  get 'joining_groups', to: 'users#joining_groups'
  get 'like_bookposts', to: 'users#like_bookposts'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
