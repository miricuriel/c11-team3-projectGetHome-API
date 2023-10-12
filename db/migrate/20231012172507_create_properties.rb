class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :area
      t.text :description
      t.string :photos
      t.boolean :active
      t.references :property_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
