class Product < ApplicationRecord

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
    has_many :product_images, dependent: :destroy
    has_many :images, through: :product_images



    attr_accessor :weight_format


    after_initialize :default_values
    # validates :title, :price, :categories, :description, :images, :weight_type, :weight
    validates :price, numericality: {greater_than: 0}
    
    # validates_format_of :prix
    enum weight_type: {Lbs: "lbs", Kg: "kg"}

    def cart_action(current_user_id)
      if $redis.sismember "cart#{current_user_id}", id
        "Remove from"
      else
        "Add to"
      end
    end

    def default_values
        if self.production_cost.nil?
        self.production_cost = 0
        end
    end

    def weight_format
        [self.weight, self.weight_type].compact.join(' ')
    end

end
