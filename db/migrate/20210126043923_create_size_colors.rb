class CreateSizeColors < ActiveRecord::Migration[6.0]
  def change
    create_table :size_colors do |t|
      t.references :size, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
