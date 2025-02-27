Rails.application.routes.draw do
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
  root 'home#index'
  get 'home/about'
  get '/prodlist', to: 'companies#_prodlist', via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
