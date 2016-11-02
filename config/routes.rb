Rails.application.routes.draw do

  post '/orders' => 'orders#create',   as: "create_order"
  get "/order"  => "orders#index",     as: "orders"
  delete "/order" => "orders#destroy", as: "order"
  post "/order" => "orders#update",   as: "update_order"
  resources :items, only: [:index]
  resources :servers


  get "/menu"  => "categories#index", as: "menu"
  root "categories#index"

  get "/:category_name" => "categories#show", as: "category_name"

end
