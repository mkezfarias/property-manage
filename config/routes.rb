Rails.application.routes.draw do
  get 'landing_pages/welcome'
  get 'landing_pages/about'
  get 'landing_pages/landlord'
  get 'landing_pages/tenant'
  resources :properties
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing_pages#welcome'
end
