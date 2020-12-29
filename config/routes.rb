Rails.application.routes.draw do
  devise_for :users, controllers: {
            passwords: "users/passwords",
            registrations: "users/registrations",
            omniauth_callbacks: "omniauth_callbacks"
          }
  devise_scope :user do 
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  root "books#top"

  resources :users,only: [:favorite] do 
    get "favorite", on: :collection
  end
  
  resources :books, only: [:index, :search] do
    get "search", on: :collection
  end

  resources :authors do 
    resource :author_favorites, only: [:index, :create, :destroy]
  end

  resources :favored_author_books

  resources :title_kanas do 
    resource :book_favorites, only: [:index, :create, :destroy]
  end
end
