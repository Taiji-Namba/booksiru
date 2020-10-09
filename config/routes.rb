Rails.application.routes.draw do
  root to: "books#home"
  resources :books do
    get "search", on: :collection
  end 
end
