class RemoveDefaultZipFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :default_zip, :string
  end
end
