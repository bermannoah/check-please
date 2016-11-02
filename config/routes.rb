Rails.application.routes.draw do


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/orders' => 'orders#create', as: "create_order"
  get "/order"  => "orders#index", as: "orders"
  delete "/order" => "orders#destroy", as: "order"

  resources :items, only: [:index]

  get "/dashboard" => "servers#show"
  resources :servers, except: [:show]


  get "/menu"  => "categories#index", as: "menu"
  root "categories#index"

  get "/:category_name" => "categories#show", as: "category_name"
end
