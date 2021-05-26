class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
