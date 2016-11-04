Rails.application.routes.draw do

  post '/tickets' => 'tickets#create',   as: "create_ticket"
  get "/tickets"  => "tickets#index",     as: "tickets"
  delete "/ticket" => "tickets#destroy", as: "ticket"

  post "/ticket" => "tickets#update",   as: "update_ticket"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/order/:server_id' => 'orders#create', as: "create_order"
  get "/order"  => "orders#index", as: "orders"
  get "/order/:id" => "orders#show", as: "get_order"
  delete "/order" => "orders#destroy", as: "order"

  resources :items, only: [:index, :show]

  get "/dashboard" => "servers#show"

  namespace :admin do
    get "/dashboard" => "dashboard#show"
    get "/dashboard/:id" => "dashboard#update"
    post "/dashboard/:id" => "dashboard#update"
    put "/dashboard/:id" => "dashboard#update"
  end

  resources :servers, except: [:show]

  get "/menu"  => "categories#index", as: "menu"
  root "categories#index"

  get "/:category_name" => "categories#show", as: "category_name"
end
