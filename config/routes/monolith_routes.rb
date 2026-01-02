module MonolithRoutes
  def self.extended(router)
    router.instance_exec do
      root to: "domains/home/home#index", controller: 'domains/home/home'
  
      get '/link_barcode', to: 'domains/croupier_core/upload_records#link_barcode', controller: 'domains/croupier_core/upload_records'
      get '/product_capture_interface', to: 'domains/croupier_core/pit_records#product_capture', controller: 'domains/croupier_core/pit_records'
      get '/company_capture_interface', to: 'domains/croupier_core/cit_records#company_capture', controller: 'domains/croupier_core/cit_records'
      get '/brick_capture', to: 'domains/classifications/bricks#brick_capture', controller: 'domains/classifications/bricks'
      get '/next_pit_record', to: 'domains/croupier_core/pit_records#next_pit_record', controller: 'domains/croupier_core/pit_records'
      get '/next_cit_record', to: 'domains/croupier_core/cit_records#next_cit_record', controller: 'domains/croupier_core/cit_records'
      post '/invoke_bit_pit_triggers', to: 'domains/croupier_core/pit_records#invoke_bit_pit_triggers', controller: 'domains/croupier_core/pit_records'
      get '/bit_interface', to: 'domains/croupier_core/bit_records#bit_interface', controller: 'domains/croupier_core/bit_records'
      get '/pit_interface', to: 'domains/croupier_core/pit_records#pit_interface', controller: 'domains/croupier_core/pit_records'
      get '/cit_interface', to: 'domains/croupier_core/cit_records#cit_interface', controller: 'domains/croupier_core/cit_records'
      post '/insert_barcode', to: 'domains/croupier_core/bit_records#insert_barcode', controller: 'domains/croupier_core/bit_records'
      get '/families_by_segment', to: 'domains/classifications/families#by_segment', controller: 'domains/classifications/families'
      get '/klasses_by_family', to: 'domains/classifications/klasses#by_family', controller: 'domains/classifications/klasses'
      get '/bricks_by_klass', to: 'domains/classifications/bricks#by_klass', controller: 'domains/classifications/bricks'
      get '/bricks_by_title_search', to: 'domains/classifications/bricks#by_title_search', controller: 'domains/classifications/bricks'
      post '/insert_product', to: 'domains/products/products#update_to_level_one', controller: 'domains/products/products'
      put '/update_pit_status', to: 'domains/products/products#update_pit_status', controller: 'domains/products/products'
      delete '/destroy_media', to: 'domains/products/product_variants#destroy_media', controller: 'domains/products/product_variants'
      get '/companies_search', to: 'domains/companies/companies#search', controller: 'domains/companies/companies'
      post '/insert_company', to: 'domains/companies/companies#insert_company', controller: 'domains/companies/companies'
      get '/industry_categories_search', to: 'domains/companies/industry_category_types#search', controller: 'domains/companies/industry_category_types'
      get '/klasses_search', to: 'domains/classifications/klasses#search', controller: 'domains/classifications/klasses'
      get '/home/about', to: 'domains/home/home#about', controller: 'domains/home/home'
      get '/people_search', to: 'domains/people/people#search', controller: 'domains/people/people'
      post '/create_bulk_bricks', to: 'domains/classifications/bricks#create_bulk', controller: 'domains/classifications/bricks'

      devise_for :users, class_name: "Domains::Users::User",
            module: :devise#, controllers: { registrations: 'registrations' }

      namespace :domains do
          namespace :website_data do
              resources :website_messages
          end
            
            namespace :users do
              resources :invitations
              resources :users
              resources :lists
            end

            namespace :croupier_core do
              resources :cit_records 
              resources :pit_records
              resources :upload_records
              resources :bit_records
              resources :scans
              # additional routes
              
            end

            namespace :classifications do
              resources :bricks 
              resources :klasses
              resources :families
              resources :segments
              resources :product_category_sources
              resources :attribute_titles
              resources :product_attributes
              resources :attribute_values
            end

            namespace :products do
              resources :product_variants, only: [:edit, :update, :destroy]
              resources :products do 
                put :update_to_level_two
              end
            end

            namespace :companies do
              resources :company_contacts
              resources :company_contact_types
              resources :company_relationships
              resources :company_relationship_types
              resources :companies do
                put :update_to_level_two
                put :update_to_level_three
                put :update_to_level_four
                put :update_to_level_five
                resources :products
              end
              resources :industry_category_types
              resources :company_snapshots
              resources :company_gender_stats
              resources :company_ethnicity_stats
              
              resources :employee_types
            end

            namespace :contact_and_identity do
              resources :addresses
              resources :address_types
              resources :country_references
            end
      
            namespace :socials do
              resources :person_social_sites
              resources :social_sites
            end

            namespace :people do
              resources :people
              resources :gender_types
              resources :ethnicity_types
            end
      end
    end
  end
end

