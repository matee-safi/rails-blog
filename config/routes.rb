Rails.application.routes.draw do
  get 'health/index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  root "users#index"
end
