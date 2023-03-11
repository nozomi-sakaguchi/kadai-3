Rails.application.routes.draw do
  get 'homes/about'
  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show, :edit, :desutroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end