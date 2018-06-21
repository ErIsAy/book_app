Rails.application.routes.draw do
      devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    resources :my_books
    
    resources :read_books
end
