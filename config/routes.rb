Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  scope module: :public do
    root 'homes#top'
    get 'orders/complete' => 'orders#complete'
    post 'orders/new' => 'orders#new'
    resources :products, only: [:index, :show]
    resources :genres, only: [:show]
    resources :orders , except: [:destroy]
    resources :shipping_addresses, except: [:new]

    resources :cart_products, only: [:index, :update, :destroy, :destroy_all, :create]

    resource :customers, only: [:edit, :update]
    post 'orders/confirm' => 'orders#confirm'
    get '/customers/my_page' => 'customers#show'
    get '/customers/check' => 'customers#check'
    patch '/customers/withdraw' => 'customers#withdraw'
    delete '/customers/cart_products/:id' => 'cart_products#destroy_all'
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

  devise_for :admin_users
  devise_for :customers, controllers:{
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
