Rails.application.routes.draw do
  resources :articles, only: %i[index]
  resources :books,    only: %i[index]
end
