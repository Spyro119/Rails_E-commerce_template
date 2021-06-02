Rails.application.routes.draw do
  get 'carts/show'
  resources :images
  # resources :product_images
  # resources :product_categories
  resources :index_images
  resources :products
  resources :categories
  resource :cart, only: [:show] do
    put 'add/:id', to: 'carts#add', as: :add_to
    put 'remove/:id', to: 'carts#remove', as: :remove_from
  end

  # devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # authenticate :user, lambda { |u| u.is_admin == true } do
    # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#index"
  get "pages/template"
  get "pages/index"
  get "pages/login"
  get "index_images" => "index_images#index"
  get "categories/:id" => "categories#show"


  # post 'pages/login' => 'session#create', :as => :user_session
  
  # devise_for :users, controllers: { sessions: 'users/sessions' } do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations" 
    }

end
