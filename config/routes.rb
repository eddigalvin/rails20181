Rails.application.routes.draw do
  resources :carts
  get 'cart/index'

  resources :orderitems
  resources :orders
  resources :addresses
  resources :users
  resources :products
  resources :cart
  
  get 'productmanu/:Manu' => 'products#showbymanu', :as => :product_manu
  get 'productpricerange/:Vatprice' => 'products#showbyprice', :as => :product_price
  
  #get '/cart/add/:id' => 'cart#add', :as => :
  get '/orderitems/create/:id' => 'orderitems#create', :as => :orderitem_create
  delete '/orderitems.id' => 'orderitems#destroy', :as => :orderitem_delete
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
