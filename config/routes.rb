Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties
=======
  resources :landlords, only: [:create, :new, :show]
>>>>>>> de56b782502ce055d9122404167081fcb6d46b55
end
