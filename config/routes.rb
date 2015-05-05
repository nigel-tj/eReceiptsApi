require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  match 'list' => 'organisation#list', :via => :get
  match 'create' => 'organisation#create', :via => :post
  match 'new' => 'organisation#new', :via => :get
  match 'show' => 'organisation#show', :via => :get
  # You can have the root of your site routed with "root"
   root 'organisation#list'

  # Example resource route within a namespace:
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
    end
  end
  
end
