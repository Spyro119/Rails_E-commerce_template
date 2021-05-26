class Size < ApplicationRecord
    has_many :product_size
    has_many :size_colors, dependent: :destroy
    has_many :colors, through: :size_colors 
    accepts_nested_attributes_for :colors, :allow_destroy => true
    

    validates :name, presence: true
    enum name: {XXXSmall: "XXXS", XXSmall: "XXS", Xsmall: "XS", Small: "S", Medium: "M", Large: "L", XLarge: "XL", XXLarge: "XXL", XXXLarge: "XXXL"}
    
end
