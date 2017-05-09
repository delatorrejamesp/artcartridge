Rails.application.routes.draw do

  mount Commontator::Engine => '/commontator'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :admin do
    resources :qoutes
  end

    get 'p/about' => 'pages#about', as: :about

    get 'p/contact' => 'pages#contact', as: :contact

    get 'p/blog' => 'pages#blog', as: :blog



    namespace :admin do

      resources :settings

    end


    constraints(subdomain: /www/) do
        root to: 'home#feeds'
    end

    constraints(subdomain: /.+/) do
        #root to: 'home#index'
        # professional pages
        match '/' => 'professional_pages#index', via: [:get], as: :professional_page
        match '/portfolio' => 'professional_pages#portfolio', via: [:get], as: :professional_page_portfolio
        match '/contact' => 'professional_pages#contact', via: [:get], as: :professional_page_contact
        match '/shop' => 'professional_pages#shop', via: [:get], as: :professional_page_shop
        match '/about' => 'professional_pages#pro', via: [:get], as: :professional_page_about
        # community pages

        match '/profile' => 'community_pages#com', via: [:get], as: :community_page
    end

    root to: 'home#feeds', as: :unauthenticated_root

    resources :categories

    devise_for :users

    authenticated :user do
        root to: 'photos#index', as: :authenticated_root
    end

    authenticate :user do

        get 'p/feature' => 'pages#feature', as: :feature_artists

        resources :photos, only: [:new, :create, :edit, :update, :destroy] do
           collection do
             get "/:user_id/take_three" => "photos#take_three", as: :take_three
           end
        end

        match 'users/:id/profile' => 'users#edit', as: 'user_profile', via: [:get]

        resources :users do
            member do
                get :portfolio
                get :photos
            end
            resources :follows, :only => [:create, :destroy]
        end
    end

    resources :photos, only: [:index, :show]



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
