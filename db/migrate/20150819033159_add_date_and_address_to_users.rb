class AddDateAndAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
  end
end
