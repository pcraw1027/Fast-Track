module ApiV1Routes
  def self.extended(router)
    router.instance_exec do
      namespace :v1 do

        namespace :app_landing, path: "", as: "" do
            get "/" => "landing#live"
            get "activity_stats" => "landing#activity_stats"
            get 'landing_metrics', to: 'landing#landing_metrics'
            get 'open_activity_stats', to: 'landing#open_activity_stats' 
            get 'top_scans', to: 'landing#top_scans'
            get 'recent_scans', to: 'landing#recent_scans'
        end

        
        devise_for :users, class_name: "Domains::Users::User", controllers: {
          sessions: 'api/v1/auth/sessions',
          registrations: "api/v1/auth/registrations"
        }

        namespace :auth, path: "", as: "" do
            delete 'logout_all', to: 'sessions#destroy_all'
            get 'profile_data', to: 'sessions#show'
            get 'verify_invite_code', to: 'registrations#verify_invite_code' 
            get 'verify_username', to: 'registrations#verify_username'        
            post 'send_password_reset_instruction', to: 'passwords#send_password_reset_instruction'
            post 'reset_password', to: 'passwords#reset_password'
            put 'update_password', to: 'passwords#update_password'
        end

        namespace :croupier_core, path: "", as: "" do
          get 'my_scans', to: 'scans#my_scans'
          get 'my_uploads', to: 'upload_records#my_uploads'
          resources :upload_records, only: [:create]
          resources :scans, only: [:show, :create]
        end

        namespace :products, path: "", as: "" do
          get 'search', to: 'products#search'
          resources :products, only: [:show] do 
            member do
              put :increment_search
            end
          end
        end

        namespace :companies, path: "", as: "" do
          resources :companies, only: [:show] do 
            member do
              put :increment_search
            end
          end
        end

        namespace :features, path: "", as: "" do
          namespace :reviewable, path: "", as: "" do
            post 'product_reviews', to: 'reviews#product_reviews'
            post 'company_reviews', to: 'reviews#company_reviews'
            get 'product_reviews', to: 'reviews#read_product_reviews'
            get 'company_reviews', to: 'reviews#read_company_reviews'
            get 'user_product_review', to: 'reviews#user_product_review'
            get 'user_company_review', to: 'reviews#user_company_review'
            resources :reviews, only: [:show, :update]
          end
        end

        namespace :website_data, path: "", as: "" do
          post 'contact_us', to: 'website_messages#contact_us'
          post 'join_us', to: 'website_messages#join_us'
        end

        namespace :users, path: "", as: "" do
          put 'update_profile', to: 'users#update' 
          put 'turn_on_scan_to_list_mode', to: 'users#turn_on_scan_to_list_mode'
          put 'turn_off_scan_to_list_mode', to: 'users#turn_off_scan_to_list_mode'          
          get 'get_user_default_list', to: 'users#get_user_default_list'  
          get 'my_lists', to: 'lists#my_lists'     
               
          resources :lists, only: [:update, :destroy, :show, :create] do
            member do 
              put :make_default
              delete :remove_list_resource
              get :list_resources
            end
          end
        end

      end
    end
  end
end
