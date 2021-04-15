Rails.application.routes.draw do
  scope module: :public do
    resources :products, only: [:index, :show]
    resources :genre, only: [:show]
    resources :orders , except: [:destroy]
    resources :shipping_adress, except: [:new]
    resources :cart_products, only: [:index, :update, :destroy]
    
    get 'order/confirm' => 'order#confirm'
    get '/customers/:id/check' => 'public/customers#check'
    patch '/customers/:id/withdraw' => 'public/customers#withdraw'
    delete '/customers/:id/cart_products/:id' => 'public/cart_products#destroy_all'
    get 'homes/about' => 'homes#about'
  end
  namespace :admin do
    resources :products,  except: [:destroy]
    resources :genre, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :homes, only: [:top]
  end
  root 'homes#top'
  devise_for :admin_users
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
