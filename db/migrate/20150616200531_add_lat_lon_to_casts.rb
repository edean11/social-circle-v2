class AddLatLonToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :lat, :string
    add_column :casts, :lon, :string
  end
end
