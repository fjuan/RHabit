RHabit::Application.routes.draw do
  resources :challenges do
    resources :milestones do
      member do
        put :complete
      end
    end
  end

  resources :chronicles

  resources :meals

  resources :payments

  resources :workouts

  devise_for :users

  get "dashboard/index"

  root 'dashboard#index'
end
