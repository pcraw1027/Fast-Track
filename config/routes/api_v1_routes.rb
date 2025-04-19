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
        post 'send_password_reset_instruction', to: 'passwords#send_password_reset_instruction'
        post 'reset_password', to: 'passwords#reset_password'
        
        resources :upload_records, only: [:create]
        resources :scans, only: [:create]
        resources :products, only: [:show]
        resources :companies, only: [:show]

      end
    end
  end
end
