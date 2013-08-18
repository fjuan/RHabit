RHabit::Application.routes.draw do
  resources :chronicles

  resources :meals

  resources :payments

  get "dashboard/index"

  root 'dashboard#index'
end
