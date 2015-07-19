class AddIndexesToUser < ActiveRecord::Migration
  def change
    add_index :users, [:uid, :provider], :unique => false
  end
end
