Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'
  resources :users, only: :index
  resources :events, except: :index
  resources :sites do
   resources :markers, only: [:create,:edit, :update, :destroy]
   resources :neighbors, except: [:index, :show]
   resources :businesses, except: [:index, :chow] do
    resources :comments, only: :create
   end
  end
end
