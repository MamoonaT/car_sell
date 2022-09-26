# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/new'
  get 'home/search', to: 'home#search'
  resources :ads, only: [:new, :create, :index, :destroy, :show] do 
    resources :ad_steps, controller: 'ad_steps'
  end
  resources :favourites
  post 'checkout/create', to: 'checkout#create'
  get 'myads', controller: :ads
end
