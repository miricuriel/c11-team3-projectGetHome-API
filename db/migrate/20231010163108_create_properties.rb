class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :operation_type
      t.string :address
      t.integer :property_type
      t.integer :bedrooms, default: 0
      t.integer :bathrooms, default: 0
      t.integer :area, default: 0
      t.text :description
      t.string :photo_url
      t.boolean :active, default: true
      t.integer :price, default: 0
      t.integer :monthly_rent, default: 0
      t.integer :maintenance, default: 0
      t.boolean :pets_allowed, default: false
      t.string :latitud
      t.string :longitud
      t.timestamps
    end
  end
end
