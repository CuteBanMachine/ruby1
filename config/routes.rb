Rails.application.routes.draw do
  root "pages#index"
  resources :users
  resources :todo_lists
  resources :lists
end