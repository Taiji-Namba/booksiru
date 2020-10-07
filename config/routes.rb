Rails.application.routes.draw do
  root to: "books#top"
  resources :books do
    get "search", on: :collection
  end 
end
