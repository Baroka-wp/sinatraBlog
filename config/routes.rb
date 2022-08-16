Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
  resources :posts, only: [:new, :create] do
    resources :comments
    resources :likes
  end
end
