class AddHomelatLonDefaultToUsers < ActiveRecord::Migration
  def change
    change_column :users, :home_lat, :string, :default => '36.1658333'
    change_column :users, :home_lon, :string, :default => '-86.7844444'
  end
end
