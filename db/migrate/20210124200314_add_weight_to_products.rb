class AddWeightToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :weight, :decimal
    add_column :products, :weight_type, :string, null: false, default: 'lbs'
  end
end
