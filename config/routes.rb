Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], module: "customers"
        resources :transactions, only: [:index], module: "customers"

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        resources :invoice, only: [:index], module: "invoice_items"
        resources :item, only: [:index], module: "invoice_items"
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
        resources :merchant, only: [:index], module: "items"
        resources :invoice_items, only: [:index], module: "items"

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], module: "merchants"
        resources :invoices, only: [:index], module: "merchants"

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

      end

      resources :transactions, only: [:index, :show] do
        resources :invoice, only: [:index], module: "transactions"

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

    end
  end
end
