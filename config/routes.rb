CraigslistJr::Application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :create, :new, :show]
  resources :sessions, only: [:create, :destroy]

  resources :categories, only: [:create, :new, :show] do
    resources :posts, only: [:create, :show]
  end
end
