class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.text :title
      t.text :content
      t.datetime :expiration
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :casts, [:user_id, :created_at]
  end
end
