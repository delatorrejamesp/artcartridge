Rails.application.routes.draw do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'



    get 'p/about' => 'pages#about', as: :about

    get 'p/contact' => 'pages#contact', as: :contact

    get 'p/blog' => 'pages#blog', as: :blog

    constraints(subdomain: /www/) do
        root to: 'home#index'
    end

    constraints(subdomain: /.+/) do
        root to: 'home#index'
        match '/' => 'profiles#pro', via: [:get], as: :professional_page
        match '/profile' => 'profiles#com', via: [:get], as: :community_page
        match '/portfolio' => 'profiles#portfolio', via: [:get], as: :professional_page_portfolio
        match '/contact' => 'profiles#contact', via: [:get], as: :professional_page_contact
        match '/shop' => 'profiles#shop', via: [:get], as: :professional_page_shop
        match '/about' => 'profiles#pro', via: [:get], as: :professional_page_about
    end

    root to: 'home#feeds', as: :unauthenticated_root

    resources :categories

    devise_for :users

    authenticated :user do
        root to: 'photos#index', as: :authenticated_root
    end

    authenticate :user do

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
