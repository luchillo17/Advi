class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_index :users, :name
    add_column :users, :bio, :string
    add_column :users, :rate, :decimal, null: false, default: 10
    add_column :users, :rating, :decimal
  end
end
