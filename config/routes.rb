Rails.application.routes.draw do
  devise_for :users
  root to: "books#home"
  resources :books do
    get "search", on: :collection
  end
end
