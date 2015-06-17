class AddDefaultZipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_zip, :string
  end
end
