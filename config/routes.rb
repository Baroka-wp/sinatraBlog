Rails.application.routes.draw do
  root 'users#index'
    # devise
  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:new, :create] do
    resources :comments
    resources :likes
  end

  # dev mailer
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
