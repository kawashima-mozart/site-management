Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'
  resources :users, only: :show
  resources :sites do
   resources :markers, only: [:create,:edit, :update, :destroy]
   resources :neighbors, except: [:index, :show]
   resources :businesses, except: [:index, :chow]
  end
end
