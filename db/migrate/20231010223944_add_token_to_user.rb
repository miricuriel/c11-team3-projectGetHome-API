class AddTokenToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token, :string, unique: true
  end
end
