class CreatePropertyForRents < ActiveRecord::Migration[7.0]
  def change
    create_table :property_for_rents do |t|
      t.integer :monthly_rent
      t.integer :maintenance
      t.boolean :pets_allowed
      t.references :properties, null: false, foreign_key: true

      t.timestamps
    end
  end
end
