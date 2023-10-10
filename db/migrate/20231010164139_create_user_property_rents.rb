class CreateUserPropertyRents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_property_rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property_rent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
