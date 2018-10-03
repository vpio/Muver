Rails.application.routes.draw do
  devise_for :users

  root 'listings#index'

  resources :listings, only: [:index, :create, :destroy, :update] do
    resources :proposals, only: [:index, :create, :destroy, :update], shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
