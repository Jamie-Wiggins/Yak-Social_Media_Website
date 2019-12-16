Rails.application.routes.draw do
  # user routes with registrations controller
  devise_for :users, controllers: { registrations: 'registrations' }
  # users with member routes following and followers
  resources :users do
    member do
      get :following, :followers
    end
  end
  # relationship routes, with only create and destory accessable
  resources :relationships, only: [:create, :destroy]
  # post resources with only show, search, new, create, destroy, edit, update accesable
  # post resources contains nested replies resources that only has access for create, destroy, edit and update
  resources :posts, only: [:show, :search, :new, :create, :destroy, :edit, :update] do
    resources :replies, only: [:create, :destroy, :edit, :update]
  end
  # group resources with access only for new, create, destroy, edit and update
  resources :groups, only: [:new, :create, :destroy, :edit, :update]
  # Define Root URL
  root 'pages#home'
  # Define Routes for Pages

  # gets the user id and displays username in place of id
  get '/user/:id' => 'pages#profile'
  # gets the group id and displays group name in place of id
  get '/group/:id' => 'pages#group'
  # gets the search posts action
  get '/search', to: "posts#search"
  # gets the contact action
  get 'contact', to: "pages#contact"
  # posts request contact
  post 'request_contact', to: "pages#request_contact"
end
