class ProductCategorySource < ApplicationRecord
    has_many :segments 
    has_many :families
    has_many :klasses
    has_many :bricks
    has_many :products
end
