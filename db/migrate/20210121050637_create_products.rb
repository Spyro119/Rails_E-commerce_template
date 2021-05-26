class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :titre,              null: false, default: ""
      t.string :description
      t.float :price, precision: 8, scale: 2, null: false, default: 0
      t.float :production_cose, precision: 8, scale:2
      t.string :sexe, null: false, default:"Men"


      t.timestamps
    end
  end
end
