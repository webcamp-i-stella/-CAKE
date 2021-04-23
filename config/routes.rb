Rails.application.routes.draw do
  scope module: :public do
    root 'homes#top'
    get 'orders/complete' => 'orders#complete'
    post 'orders/new' => 'orders#new'
    resources :products, only: [:index, :show]
    resources :genres, only: [:show]
    resources :orders , except: [:destroy]
    resources :shipping_addresses, except: [:new]
    resources :cart_products, only: [:index, :update, :destroy, :create]
    resource :customers, only: [:edit, :update]
    post 'orders/confirm' => 'orders#confirm'
    get '/customers/my_page' => 'customers#show'
    get '/customers/check' => 'customers#check'
    patch '/customers/withdraw' => 'customers#withdraw'
    delete '/customers/cart_products/destroy_all' => 'cart_products#destroy_all'
    get 'homes/about' => 'homes#about'
  end
  namespace :admin do
    resources :products,  except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update, :index]
    resources :order_details, only: [:update]
    resources :homes, only: [:top]
    resources :customers, except: [:new, :create, :destroy]
  end

  Rails.application.routes.draw do
    devise_for :admin_users, controllers:{
      sessions: 'admin_users/sessions'
    }
    devise_for :customers, controllers:{
      registrations: 'customers/registrations',
      sessions: 'customers/sessions'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
