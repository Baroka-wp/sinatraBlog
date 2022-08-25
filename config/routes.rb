Rails.application.routes.draw do
  root 'users#index'
  # devise
  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments
    resources :likes
  end

  # dev mailer
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  #api routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new]
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:new, :create, :destroy] do
        resources :comments
        resources :likes
      end
    end
  end

  namespace :api do
    namespace :v1 do
      devise_for :users,
        controllers: {
            sessions: 'api/v1/users/sessions',
            registrations: 'api/v1/users/registrations'
        }
    end
  end
end
