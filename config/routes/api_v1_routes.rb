module ApiV1Routes
  def self.extended(router)
    router.instance_exec do
      namespace :v1 do

        get "/" => "landing#live"
        devise_for :users, controllers: {
          sessions: 'api/v1/sessions',
          registrations: "api/v1/registrations"
        }

        delete 'logout_all', to: 'sessions#destroy_all'
        post 'send_password_reset_instruction', to: 'passwords#send_password_reset_instruction'
        post 'reset_password', to: 'passwords#reset_password'
        
        resources :upload_records, only: [:create]
        resources :scans, only: [:create]

      end
    end
  end
end
