class AddTimeOffsetToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :time_offset, :string
  end
end
