class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => ""
      t.string :uid, :null => false, :default => ""

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Tokens
      t.text :tokens
    end

    add_index :users, [:uid, :provider],     :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
