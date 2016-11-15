Rails.application.routes.draw do
  get '/books', controller: :books, action: :index
  root 'books#index'
  get '/books/new', controller: :books, action: :new
  post '/books', controller: :books, action: :create
  get '/books/:id', controller: :books, action: :show, as: :book
  get '/books/:id/edit', controller: :books, action: :edit, as: :edit_book
  patch '/books/:id', controller: :books, action: :update, as: :update_book
  delete '/books/:id', controller: :books, action: :destroy, as: :delete_book
  post '/books/search', controller: :books, action: :search, as: :search_books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
