RHabit::Application.routes.draw do
  resources :chronicles

  resources :meals

  resources :payments

  devise_for :users

  get "dashboard/index"

  root 'dashboard#index'
end
