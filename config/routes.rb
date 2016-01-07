require 'api_constraints'

Rails.application.routes.draw do

  devise_for :admins
  #devise_for :users
  match 'list' => 'organisation#list', :via => :get
  match 'create' => 'organisation#create', :via => :post
  match 'new' => 'organisation#new', :via => :get
  match 'show' => 'organisation#show', :via => :get
  match 'edit' => 'organisation#edit', :via => :get
  match 'update' => 'organisation#update', :via => :patch
  match 'all_receipts' => 'organisation#receipts', :via => :get
  match 'index' => 'organisation#list', :via => :get
  # You can have the root of your site routed with "root"
   root 'organisation#list'

  # Example resource route within a namespace:
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy, :login] do
        # this is the line
        match "login" => "users#login", :via => :post
      end
      resources :sessions, :only => [:create, :destroy]
      resources :receipts do
        get '/token/:token' => 'receipts#receipt' 
        post 'fetch_receipts' => 'receipts#receipts' 
      end
    end
  end
end
