module ApiV1Routes
  def self.extended(router)
    router.instance_exec do
      namespace :v1 do

        get "/" => "landing#live"
        get "activity_stats" => "landing#activity_stats"
        
        devise_for :users, controllers: {
          sessions: 'api/v1/sessions',
          registrations: "api/v1/registrations"
        }

        delete 'logout_all', to: 'sessions#destroy_all'
        get 'profile_data', to: 'sessions#show'
        get 'landing_metrics', to: 'landing#landing_metrics'
        get 'open_activity_stats', to: 'landing#open_activity_stats' 
        get 'top_scans', to: 'landing#top_scans'
        get 'my_scans', to: 'scans#my_scans'
        get 'verify_invite_code', to: 'registrations#verify_invite_code'        
        post 'send_password_reset_instruction', to: 'passwords#send_password_reset_instruction'
        post 'reset_password', to: 'passwords#reset_password'
        put 'update_password', to: 'passwords#update_password'
        
        post 'product_reviews', to: 'reviews#product_reviews'
        post 'company_reviews', to: 'reviews#company_reviews'
        get 'product_reviews', to: 'reviews#get_product_reviews'
        get 'company_reviews', to: 'reviews#get_company_reviews'
        get 'user_product_review', to: 'reviews#user_product_review'
        get 'user_company_review', to: 'reviews#user_company_review'
        put 'update_profile', to: 'users#update' 
        
        get 'my_uploads', to: 'upload_records#my_uploads'
        get 'search', to: 'products#search'
        
        resources :reviews, only: [:show, :update]
        resources :upload_records, only: [:create]
        resources :scans, only: [:show, :create]
        resources :products, only: [:show] do 
          member do
            put :increment_search
          end
        end
        resources :companies, only: [:show] do 
          member do
            put :increment_search
          end
        end

      end
    end
  end
end
