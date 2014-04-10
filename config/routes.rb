Blocitoff::Application.routes.draw do

  devise_for :users

  resources :lists do
    resources :tasks, except: [:index]
  end

  # resources :task, only: [:destroy]
  get "/tasks/", to: 'tasks#index'
  post "/tasks/complete", to: "tasks#complete"

  get "welcome/index"
  root to: 'welcome#index'
end





