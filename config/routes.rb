Papa::Application.routes.draw do

  resources :cortes


  resources :sales

  resources :ventas

  resources :compra_categories

  resources :products

  resources :product_categories

  resources :compras

  resources :gastos

  resources :ventas

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
