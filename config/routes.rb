Rails.application.routes.draw do




  get 'modals/photos'

  get 'pages/blog'

  resources :categories

  get 'pages/about', as: :about

  get 'pages/contact', as: :contact

  get 'pages/blog', as: :blog
  devise_for :users

  authenticated :user do
    root to: 'photos#index', as: :authenticated_root
  end
  root to: 'home#index'

  authenticate :user do
    resources :photos, only: [:new, :create, :edit, :update, :destroy]

    match "users/:id/profile" => "users#edit", as: "user_profile", via: [ :get ]
    resources :users do
      member do
        get :portfolio
      end
    end
  end
  resources :photos, only: [:index, :show]

  match ":id/(profile)" => "users#show",  via: [ :get ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
