Rails.application.routes.draw do
  devise_for :users, controllers: {
            omniauth_callbacks: "omniauth_callbacks",
          }
  devise_scope :user do 
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  root "books#home"
  
  resources :books do
    get "search", on: :collection
  end

  resources :authors do 
    resource :author_favorites, only: [:index, :create, :destroy]
  end

  resources :favored_author_books

  resources :favored_books do 
    resource :book_favorites, only: [:index, :create, :destroy]
  end
end
