Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts, only: [:show, :index]
  resources :pictures, only: [:create, :destroy]
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  namespace :admin do
    resources :categories, except: [:show]
    resources :posts, except: [:show, :index]
  end
end
