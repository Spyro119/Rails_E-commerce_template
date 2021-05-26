class CreateProductSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sizes do |t|
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true

      t.timestamps
    end
  end
end
