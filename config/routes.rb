Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "public/homes#top"
  get 'homes/about'
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update, :confirm, :withdraw]
  resources :addresses, only: [:create, :index, :edit, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_deteils, only: [:update]
  end
end
