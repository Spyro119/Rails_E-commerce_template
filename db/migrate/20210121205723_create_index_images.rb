class CreateIndexImages < ActiveRecord::Migration[6.0]
  def change
    create_table :index_images do |t|
      t.string :titre
      t.string :description
      t.string :image
      t.timestamps
    end
  end
end
