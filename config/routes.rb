Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'
  resources :users, only: :show
  resources :sites do
   resources :markers, only: [:create,:edit, :update, :destroy]
   resources :neighbors, except: [:index, :show]
   resources :business_schedules, only: [:new, :create]
   resources :businesses, only: [:edit, :update, :destroy] do
    resources :comments, only: [:create]
   end
  end
end
