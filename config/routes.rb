Rails.application.routes.draw do

  resources :categories

  get 'pages/about', as: :about

  get 'pages/contact', as: :contact

  devise_for :users

  authenticated :user do
    root to: 'photos#index', as: :authenticated_root
  end
  root to: 'home#index'

  authenticate :user do
    resources :photos, only: [:new, :create, :edit, :update, :destroy]

    match "users/:id/profile" => "users#edit", as: "user_profile", via: [ :get ]
    resources :users do
      
    end
  end
  resources :photos, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
