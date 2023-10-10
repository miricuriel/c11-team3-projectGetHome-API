class CreateUserPropertySales < ActiveRecord::Migration[7.0]
  def change
    create_table :user_property_sales do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property_sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end