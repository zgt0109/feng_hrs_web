class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :idcard
      t.string :gender
      t.date :birthday
      t.string :channel
      t.string :province
      t.string :city
      t.string :district
      t.string :state
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :labors, :name
    add_index :labors, :mobile
    add_index :labors, :idcard
    add_index :labors, :gender
    add_index :labors, :birthday
    add_index :labors, :channel
    add_index :labors, :province
    add_index :labors, :city
    add_index :labors, :district
    add_index :labors, :state
    add_index :labors, :deleted_at
  end
end
