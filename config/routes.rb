Blocitoff::Application.routes.draw do

  devise_for :users

  resources :lists do
    resources :tasks
  end

  get "welcome/index"
  root to: 'welcome#index'
end

