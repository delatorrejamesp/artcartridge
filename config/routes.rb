Rails.application.routes.draw do

  get 'pages/about'

  get 'pages/contact'

  devise_for :users

  authenticated :user do
    root to: 'photos#index', as: :authenticated_root
  end
  root to: 'home#index'

  authenticate :user do
    resources :photos, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :photos, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
