Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get "/:controller/:action"
      get "/customers/find",              defaults: { format: :json }
      get "/customers/find_all",          defaults: { format: :json }
      get "/customers/random",            defaults: { format: :json }
      get "/customers/:id/invoices",      defaults: { format: :json }, to: "customers#invoices"
      get "/customers/:id/transactions",  defaults: { format: :json }, to: "customers#transactions"

      get "/invoice_items/find",          defaults: { format: :json }
      get "/invoice_items/find_all",      defaults: { format: :json }
      get "/invoice_items/random",        defaults: { format: :json }
      get "/invoice_items/:id/item",      defaults: { format: :json }, to: "invoice_items#item"
      get "/invoice_items/:id/invoice",   defaults: { format: :json }, to: "invoice_items#invoice"

      get "/invoices/find",               defaults: { format: :json }
      get "/invoices/find_all",           defaults: { format: :json }
      get "/invoices/random",             defaults: { format: :json }
      get "/invoices/:id/transactions",   defaults: { format: :json }, to: "invoices#transactions"
      get "/invoices/:id/invoice_items",  defaults: { format: :json }, to: "invoices#invoice_items"
      get "/invoices/:id/items",          defaults: { format: :json }, to: "invoices#items"
      get "/invoices/:id/customer",       defaults: { format: :json }, to: "invoices#customer"
      get "/invoices/:id/merchant",       defaults: { format: :json }, to: "invoices#merchant"

      get "/items/find",                  defaults: { format: :json }
      get "/items/find_all",              defaults: { format: :json }
      get "/items/random",                defaults: { format: :json }
      get "/items/:id/invoice_items",     defaults: { format: :json }, to: "items#invoice_items"
      get "/items/:id/merchant",          defaults: { format: :json }, to: "items#merchant"

      get "/merchants/find",              defaults: { format: :json }
      get "/merchants/find_all",          defaults: { format: :json }
      get "/merchants/random",            defaults: { format: :json }
      get "/merchants/:id/items",         defaults: { format: :json }, to: "merchants#items"
      get "/merchants/:id/invoices",      defaults: { format: :json }, to: "merchants#invoices"

      get "/transactions/find",           defaults: { format: :json }
      get "/transactions/find_all",       defaults: { format: :json }
      get "/transactions/random",         defaults: { format: :json }
      get "/transactions/:id/invoice",    defaults: { format: :json }, to: "transactions#invoice"

      resources :customers,     only: [:index, :show], defaults: { format: :json }
      resources :invoice_items, only: [:index, :show], defaults: { format: :json }
      resources :invoices,      only: [:index, :show], defaults: { format: :json }
      resources :items,         only: [:index, :show], defaults: { format: :json }
      resources :merchants,     only: [:index, :show], defaults: { format: :json }
      resources :transactions,  only: [:index, :show], defaults: { format: :json }
    end
  end
end
