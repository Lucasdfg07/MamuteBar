require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :sales

  resources :categories
  resources :products

  resources :requests

  root "sales#index"


  mount Sidekiq::Web => '/sidekiq'
end
