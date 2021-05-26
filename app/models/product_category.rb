class ProductCategory < ApplicationRecord
    belongs_to :produit 
    belongs_to :category 
end
