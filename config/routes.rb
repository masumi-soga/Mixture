Rails.application.routes.draw do
  get 'tag/index'
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "/about" => "homes#about"
  get 'tags' => 'tag#index', as: 'tags'

  resources :notifications, only: [:index] do
    collection do
      delete  'destroy_all'
    end
  end

  scope module: :admins do
    resources :admins, only: [:index, :show,]
  end

    resources :users do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end

    resources :post_contents do
      resource :goods, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
end
