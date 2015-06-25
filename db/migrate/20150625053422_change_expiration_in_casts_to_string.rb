class ChangeExpirationInCastsToString < ActiveRecord::Migration
  def change
    change_column :casts, :expiration,  :string
  end
end
