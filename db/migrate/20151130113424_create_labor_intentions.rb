class CreateLaborIntentions < ActiveRecord::Migration
  def change
    create_table :labor_intentions do |t|
      t.references :labor, index: true, foreign_key: true
      t.string :salary
      t.string :province
      t.string :city
      t.string :district

      t.timestamps null: false
    end
    add_index :labor_intentions, :salary
    add_index :labor_intentions, :province
    add_index :labor_intentions, :city
    add_index :labor_intentions, :district
  end
end
