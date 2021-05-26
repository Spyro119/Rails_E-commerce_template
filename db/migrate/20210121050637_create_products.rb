class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title,              null: false, default: ""
      t.string :description
      t.float :price, precision: 8, scale: 2, null: false, default: 0
      t.float :production_cost, precision: 8, scale:2

      t.timestamps
    end
  end
end
