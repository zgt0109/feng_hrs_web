class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.text :introduction
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :companies, :name
    add_index :companies, :province
    add_index :companies, :city
    add_index :companies, :district
    add_index :companies, :deleted_at
  end
end
