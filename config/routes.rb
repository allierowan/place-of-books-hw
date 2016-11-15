Rails.application.routes.draw do
  get '/books', controller: :books, action: :index
  root 'books#index'
  get '/books/new', controller: :books, action: :new
  post '/books', controller: :books, action: :create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
