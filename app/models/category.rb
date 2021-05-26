class Category < ApplicationRecord
    # belongs_to :produit
    has_many :product_categories
    has_many :products, through: :product_categories

    
    validates :name, presence: true
    validates_uniqueness_of :name
    # def name
    #     return self.name.to_s
    # end
end
