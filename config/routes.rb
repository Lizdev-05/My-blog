Rails.application.routes.draw do
  devise_for :users
  
    namespace :api do
      namespace :v1 do
        post :auth, to: 'authentication#create'
        resources :users, only: [] do
          resources :posts, only: [:index] do
            resources :comments, only: [:index, :create]
          end
        end
      end
    end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
    # devise_for :users, controllers: { confirmations: 'users/confirmations' }
    root to: 'users#index'
end