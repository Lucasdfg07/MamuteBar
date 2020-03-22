require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :sales, except: [:show] do
  	collection do
  		patch ':id/edit', action: 'update'
  	end
  end

  get 'sales/graph'

  resources :categories
  resources :products

  resources :requests do
    collection do
      get 'index'
      post 'edit'
      post 'update'
      get 'decrement_products_and_quantity'
      get 'increment_products_and_quantity'
    end
  end
  resources :pucharses

  root "sales#index"


  mount Sidekiq::Web => '/sidekiq'
end
