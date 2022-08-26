Rails.application.routes.draw do
  root 'users#index'
    # devise
    devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
      }
  
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

  # Api routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new]
      end
      resources :posts, only: [:new, :create, :destroy] do
        resources :comments
        resources :likes
      end
      devise_for :users,
          controllers: {
            sessions: 'users/sessions',
            registrations: 'users/registrations'
            }
    end
  end
end
