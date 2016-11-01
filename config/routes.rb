Rails.application.routes.draw do

  get "/menu"  => "categories#index"
  resources :categories, only: [:show]
  resources :servers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
