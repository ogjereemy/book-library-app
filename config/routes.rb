Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show]
  
  resources :books do
    member do
      post 'borrow'
      delete 'return'
      post 'return'
      delete 'return'
    end
  end
  
  resources :borrowings, only: [:index, :create, :update, :destroy]
  
  get 'user_profile/:user_id', to: 'users#profile', as: 'user_profile'

  # get '/users/sign_out', to: redirect('/')

  get 'user/:user_id/borrowings', to: 'borrowings#index', as: 'user_borrowings'
  
  root 'books#index'
end
