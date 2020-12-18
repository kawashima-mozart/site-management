Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'sites#index'
  resources :users, only: :index
  resources :events, except: :index
  resources :sites do
    collection do
      get 'search'
    end
   resources :markers, only: [:create,:edit, :update, :destroy]
   resources :neighbors, except: [:index, :show]
   resources :businesses, except: [:index, :show] do
    resources :comments, only: :create
   end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get 'businesses/search' 
 
end
