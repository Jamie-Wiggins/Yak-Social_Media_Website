Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
 
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships
  # , only: [:create, :destroy]
  resources :posts do
    resources :replies
  end

  resources :groups

  # Define Root URL
  root 'pages#home'
  
  # Define Routes for Pages
  get '/user/:id' => 'pages#profile'
  get '/group/:id' => 'pages#group'
  get 'search', to: "posts#search"
  get 'contact', to: "pages#contact"
  post 'request_contact', to: "pages#request_contact"
end
