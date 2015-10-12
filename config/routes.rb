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
  match '' => 'organisation#receipts', :via => :get
  match 'index' => 'organisation#list', :via => :get
  # You can have the root of your site routed with "root"
   root 'organisation#list'

  # Example resource route within a namespace:
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy] do
        # this is the line
        match "login" => "users#show_by_email", :via => :get
        resources :receipts, :only => [:show, :update, :destroy, :create]
      end
      resources :sessions, :only => [:create, :destroy]
      resources :receipts do
        get '/token/:token' => 'receipts#receipt' 
      end
    end
  end
end
