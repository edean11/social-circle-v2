class CreateCastgroups < ActiveRecord::Migration
  def change
    create_table :castgroups do |t|
      t.references :cast, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
