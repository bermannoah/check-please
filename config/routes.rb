Rails.application.routes.draw do

  post '/orders' => 'orders#create', as: "orders"

  resources :items, only: [:index]
  resources :orders, only: [:show]
  resources :servers


  get "/menu"  => "categories#index", as: "menu"
  root "categories#index"

  get "/:category_name" => "categories#show", as: "category_name"

end
