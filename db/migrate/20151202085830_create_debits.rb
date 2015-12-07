class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.references :bank, index: true, foreign_key: true
      t.string :name
      t.string :account
      t.string :deposit

      t.timestamps null: false
    end
    add_index :debits, :name
    add_index :debits, :account
  end
end
