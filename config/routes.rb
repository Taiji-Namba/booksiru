Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  root "books#home"
  
  resources :books do
    get "search", on: :collection
  end

  resources :authors do 
    resource :author_favorites
  end

  resources :favored_author_books

end
