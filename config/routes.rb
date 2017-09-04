Rails.application.routes.draw do
  resources :articles, only: %i[index]
  resources :books,    only: %i[index] do
    collection do
      get 'prime' => 'books/primes#index'
    end
  end

  namespace :search do
    get 'filter' => 'filter#index'
  end
end
