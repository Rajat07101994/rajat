require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  get "dummy/index"
  # Api definition
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :user, :only => [:show]
    end
  end
end
