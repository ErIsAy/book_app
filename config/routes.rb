Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/search', to: 'search#index'
  get '/search_results', to: 'search#search'
  post '/create_from_book_history/:book_history_id', to: 'my_books#create_from_book_history', as: :create_from_book_history

  resources :book_histories, only: [:show] do
      resources :reviews, only: [:new, :create, :edit]
  end
  resources :dashboard
  resources :my_books
  resources :read_books
    
    
end
