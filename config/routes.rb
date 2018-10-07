Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  resources :guests, only: [:index]

  # root 'guests#index'

  resources :listings, :guests
  resource :proposals

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
