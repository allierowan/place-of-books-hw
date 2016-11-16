Rails.application.routes.draw do

  resources :reservations do
    collection do
    end
  end

  resources :books do
    member do
      get '/reservations', controller: :books, action: :books_reservations
      get '/reservations/new', controller: :books, action: :reserve_book
      post '/reservations', controller: :books, action: :create_reservation
    end

    collection do
      post :search
    end
  end
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
