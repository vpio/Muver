Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'static_pages#home'

  get 'users/:id' => 'users#show', as: :user_profile
  get 'users/:id/pic' => 'users#new', as: :user_avatar
  post 'users/:id/pic' => 'users#create'


  resources :guests, only: [:index, :show]
  resources :listings
  resource :proposals

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
