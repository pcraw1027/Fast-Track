module MonolithRoutes
  def self.extended(router)
    router.instance_exec do
      devise_for :users#, controllers: { registrations: 'registrations' }

      resources :cit_records do 
        get :company_capture_interface
      end
      resources :pit_records do
        get :product_capture_interface
      end
      resources :upload_records
      resources :bit_records
      resources :scans

      resources :users, only: [:show, :index, :destroy]
      resources :product_variants, only: [:edit, :update, :destroy]
      resources :attribute_titles
      resources :product_attributes
      resources :attribute_values
      resources :products do 
        put :update_to_level_two
      end
      resources :bricks
      resources :klasses
      resources :families
      resources :segments
      resources :product_category_sources
      resources :company_gender_stats
      resources :company_ethnicity_stats
      resources :gender_types
      resources :employee_types
      resources :ethnicity_types
      resources :company_contacts
      resources :company_contact_types
      resources :company_relationships
      resources :company_relationship_types
      resources :industry_category_types
      #resources :companies
      resources :companies do
        put :update_to_level_two
        resources :products
      end

      resources :invitations
      
      #get 'home/index'

      root to: "home#index"
      get 'home/about'
      # additional routes
      get '/bit_interface', to: 'bit_records#bit_interface'
      get '/pit_interface', to: 'pit_records#pit_interface'
      get '/cit_interface', to: 'cit_records#cit_interface'
      post '/insert_barcode', to: 'bit_records#insert_barcode' 
      get '/companies_search', to: 'companies#search'
      get '/industry_categories_search', to: 'industry_category_types#search'
      get '/families_by_segment', to: 'families#by_segment'
      get '/klasses_by_family', to: 'klasses#by_family'
      get '/bricks_by_klass', to: 'bricks#by_klass'

      post '/insert_product', to: 'products#insert_product'
      post '/insert_company', to: 'companies#insert_company'
   
    end
  end
end
