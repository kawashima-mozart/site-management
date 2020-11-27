Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'
  resources :users, only: :show
  resources :sites, only: [:index, :new, :create, :show] do
   resources :markers, only: [:create,:edit, :update, :destroy]
   resources :neighbors, except: [:index, :show]
  end
end
