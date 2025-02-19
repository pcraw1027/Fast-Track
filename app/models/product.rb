class Product < ApplicationRecord
  belongs_to :company
  belongs_to :segment
  belongs_to :family
  belongs_to :klass
  belongs_to :brick
end
