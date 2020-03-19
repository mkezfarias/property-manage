# frozen_string_literal: true

Rails.application.routes.draw do
  get 'landing_pages/welcome'
  get 'landing_pages/about'
  get 'landing_pages/landlord'
  get 'landing_pages/tenant'
  get 'landing_pages/algolia_search/', to: 'properties#fast_search'
  resources :properties
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing_pages#welcome'
end
