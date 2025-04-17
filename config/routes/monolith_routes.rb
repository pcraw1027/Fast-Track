module MonolithRoutes
  def self.extended(router)
    router.instance_exec do
      devise_for :users#, controllers: { registrations: 'registrations' }

      resources :cit_records
      resources :pit_records
      resources :upload_records
      resources :bit_records
      resources :scans

      resources :users, only: [:show, :index, :destroy]
      resources :product_variants, only: [:edit, :update, :destroy]
      resources :attribute_titles
      resources :product_attributes
      resources :attribute_values
      resources :products
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
        resources :products
      end
      #get 'home/index'

      root to: "home#index"
      get 'home/about'
      get '/prodlist', to: 'companies#_prodlist', via: :get

      # additional routes
      get '/companies_search', to: 'companies#search'
      get '/families_by_segment', to: 'families#by_segment'
      get '/klasses_by_family', to: 'klasses#by_family'
      get '/bricks_by_klass', to: 'bricks#by_klass'
   
    end
  end
end
