Rails.application.routes.draw do
      devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:'home#index'
    
  get '/search', to: 'search#index'
  get '/search_results', to: 'search#search'    
    
  resources :dashboard 
  resources :my_books
  resources :read_books
  
end
