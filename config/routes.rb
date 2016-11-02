Rails.application.routes.draw do

  post '/tickets' => 'tickets#create',   as: "create_ticket"
  get "/tickets"  => "tickets#index",     as: "tickets"
  delete "/ticket" => "tickets#destroy", as: "ticket"
  post "/ticket" => "tickets#update",   as: "update_ticket"
  resources :items, only: [:index]
  resources :servers


  get "/menu"  => "categories#index", as: "menu"
  root "categories#index"

  get "/:category_name" => "categories#show", as: "category_name"

end
