class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_address, :string
    add_column :users, :zip, :integer
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
