Rails.application.routes.draw do
  devise_for :users
  get 'health/index'
  resources :users do
    resources :posts do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
  root "users#index"
end
