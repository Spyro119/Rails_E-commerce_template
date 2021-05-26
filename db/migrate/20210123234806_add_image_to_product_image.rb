class AddImageToProductImage < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_images, :image, foreign_key: true
  end
end
