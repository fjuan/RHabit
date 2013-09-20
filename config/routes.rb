RHabit::Application.routes.draw do
  resources :challenges

  resources :chronicles

  resources :meals

  resources :payments

  resources :workouts

  devise_for :users

  get "dashboard/index"

  root 'dashboard#index'
end
