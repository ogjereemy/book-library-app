Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show]
  
  resources :books do
    member do
      post 'borrow'
      delete 'return_book'
    end
  end
  
  resources :borrowings, only: [:index, :create, :update, :destroy] do
    member do
      delete 'return_book', to: 'borrowings#return_book'
      get 'return_book'
    end
  end
  
  get 'user_profile/:user_id', to: 'users#profile', as: 'user_profile'
  get 'user/:user_id/borrowings', to: 'borrowings#index', as: 'user_borrowings'
  
  root 'books#index'
end
