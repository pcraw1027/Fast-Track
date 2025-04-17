Rails.application.routes.draw do
  
  extend MonolithRoutes
 
  defaults format: :json do
    namespace :api do
       extend ApiV1Routes
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
