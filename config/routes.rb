Rails.application.routes.draw do


  resources :items, only: [:index]
  get "/menu"  => "categories#index"
  root "categories#index"

  resources :servers
  get "/:category_name" => "categories#show", as: "category_name"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
