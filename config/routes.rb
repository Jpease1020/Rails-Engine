Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], module: "customers", as: :invoices
        resources :transactions, only: [:index], module: "customers", as: :transactions

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], module: "merchants", as: :items
        resources :invoices, only: [:index], module: "merchants", as: :invoices

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

      end

      resources :transactions, only: [:index, :show] do
        resources :invoices, only: [:index], module: "transactions", as: :invoices
        
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

    end
  end
end
