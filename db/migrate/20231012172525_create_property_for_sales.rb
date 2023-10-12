class CreatePropertyForSales < ActiveRecord::Migration[7.0]
  def change
    create_table :property_for_sales do |t|
      t.integer :price
      t.references :properties, null: false, foreign_key: true

      t.timestamps
    end
  end
end
