class AddHomeLatAndHomeLonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :home_lat, :string
    add_column :users, :home_lon, :string
  end
end
