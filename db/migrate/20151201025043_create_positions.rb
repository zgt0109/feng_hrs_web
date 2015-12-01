class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.string :name_seo
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :positions, :name
    add_index :positions, :name_seo
    add_index :positions, :parent_id
    add_index :positions, :lft
    add_index :positions, :rgt
    add_index :positions, :deleted_at
  end
end
