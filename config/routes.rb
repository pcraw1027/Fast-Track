require_relative 'routes/api_v1_routes.rb'
require_relative 'routes/monolith_routes.rb'

Rails.application.routes.draw do
  
  resources :person_social_sites
  extend MonolithRoutes
 
  defaults format: :json do
    namespace :api do
       extend ApiV1Routes
    end
  end

end
