RHabit::Application.routes.draw do
  resources :chronicles

  resources :meals

  resources :payments

  resources :workouts

  devise_for :users

  get "dashboard/index"

  root 'dashboard#index'
end
