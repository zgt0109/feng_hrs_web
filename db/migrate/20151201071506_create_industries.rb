class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
      t.string :name_seo
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :industries, :name
    add_index :industries, :name_seo
    add_index :industries, :parent_id
    add_index :industries, :lft
    add_index :industries, :rgt
    add_index :industries, :deleted_at
  end
end
