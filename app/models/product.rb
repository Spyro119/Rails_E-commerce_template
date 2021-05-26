class Product < ApplicationRecord
    before_destroy :destroy_colors, prepend: true
    before_validation :set_size_uniqueness

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
    has_many :product_images, dependent: :destroy
    has_many :images, through: :product_images
    has_many :product_sizes, dependent: :destroy
    has_many :sizes, through: :product_sizes
    accepts_nested_attributes_for :sizes, :allow_destroy => true



    attr_accessor :weight_format, :total_quantity, :size_options


    after_initialize :default_values
    validates :titre, :prix, :sexe, :categories, :description, :images, :weight_type, :weight, :sizes, presence: true
    validates :prix, numericality: {greater_than: 0}
    
    # validates_format_of :prix
    enum sexe: {Men: "Men", Women: "Women"}
    enum weight_type: {Lbs: "lbs", Kg: "kg"}


    def default_values
        if self.coût_de_production.nil?
        self.coût_de_production = 0
        end
    end

    def weight_format
        [self.weight, self.weight_type].compact.join(' ')
    end

    def total_quantity
        _total_quantity = 0
        self.sizes.each do |size|
            if size.colors 
                size.size_colors.each do |size_colors|
                if size_colors.color
                    color = Color.where(id: size_colors.color_id)
                    size_colors.color.quantity
                    _total_quantity += size_colors.color.quantity
                    end
                end
            end
        end
        _total_quantity
    end

    def size_options
        size_options = Array.new()
        sizes.each do |size|
            size_options.push(size.name)
        end
        puts "size Options before filtering : #{size_options}"
        size_options = size_options.uniq
    end

    def destroy_colors
        # product.find(:id)
        self.sizes.each do |size|
            if size.colors 
                size.size_colors.each do |size_colors|
                size_colors.destroy
                if size_colors.color
                    color = Color.where(id: size_colors.color_id)
                    size_colors.color.destroy
                    puts "SIZE COLOR = #{size_colors.color}"
                    end
                end
            end
        end
    end

    def set_size_uniqueness
        if self.sizes.group_by {|s| s.name} .select { |k, v| v.size > 1 }.map(&:first) != []
        errors.add(:size, 'Plusieurs grandeurs ont la même valeur.')
        end
    end

end
