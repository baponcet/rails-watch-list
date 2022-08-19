Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
end
