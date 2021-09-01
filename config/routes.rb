Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    resources :reviews, only: [:create, :new, :show]
  end
  resources :landlords, only: [:create, :new, :show, :index]
  resources :reviews, only: [:destroy]
end
