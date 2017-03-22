Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index', as: :unauthenticated_root

  get 'about' => "pages#about", as: :about

  get 'contact' => "pages#contact", as: :contact

  get 'blog' => "pages#blog", as: :blog

  constraints(:subdomain => /www/) do
      root to: 'home#index'
  end

  constraints(:subdomain => /.+/) do
    match "/" => 'profiles#pro', via: [ :get ], as: :professional_page
    match "/profile" => "profiles#com",  via: [ :get ], as: :community_page
    match "/portfolio" => "profiles#portfolio",  via: [ :get ], as: :professional_page_portfolio
    match "/contact" => "profiles#contact",  via: [ :get ], as: :professional_page_contact
    match "/shop" => "profiles#shop",  via: [ :get ], as: :professional_page_shop
    match "/about" => "profiles#about",  via: [ :get ], as: :professional_page_about
  end

  # match "/profile" => "users#show",  via: [ :get ]
  # match "/portfolio" => "users#portfolio",  via: [ :get ], as: :professional_page_portfolio
  # match "/contact" => "pages#contact",  via: [ :get ], as: :professional_page_contact
  # match "/shop" => "pages#shop",  via: [ :get ], as: :professional_page_shop




  resources :categories

  devise_for :users

  authenticated :user do
    root to: 'photos#index', as: :authenticated_root
  end


  authenticate :user do

    resources :photos, only: [:new, :create, :edit, :update, :destroy]

    match "users/:id/profile" => "users#edit", as: "user_profile", via: [ :get ]
    resources :users do
      member do
        get :portfolio
        get :photos
      end
    end
  end

  resources :photos, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
