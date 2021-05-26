class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :name, null: false, default: ''
      t.integer :quantity

      t.timestamps
    end
  end
end
