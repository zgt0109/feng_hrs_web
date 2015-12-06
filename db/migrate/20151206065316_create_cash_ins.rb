class CreateCashIns < ActiveRecord::Migration
  def change
    create_table :cash_ins do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :serial_outer
      t.string :serial_inner
      t.string :channel
      t.string :state
      t.string :note
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
