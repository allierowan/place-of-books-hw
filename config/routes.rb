Rails.application.routes.draw do
  resources :books do
    member do
    end

    collection do
      post :search
    end
  end
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
