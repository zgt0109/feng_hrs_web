class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :domain
      t.string :uri
      t.string :icon
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
