class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :operation_type
      t.string :address
      t.references :property_type, null: false, foreign_key: true
      t.integer :bedroom
      t.integer :bathroom
      t.integer :area
      t.text :description
      t.string :photo_url
      t.boolean :active

      t.timestamps
    end
  end
end
