Rails.application.routes.draw do

  get 'categories/index'

  get "/menu"  => "categories#index"
  resources :servers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
