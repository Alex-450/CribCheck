Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :landlords, only: [:create, :new, :show]
end
