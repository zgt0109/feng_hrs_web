class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :gender
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :contacts, :name
    add_index :contacts, :mobile
    add_index :contacts, :gender
    add_index :contacts, :deleted_at
  end
end
