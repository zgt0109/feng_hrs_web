class CreateCashOuts < ActiveRecord::Migration
  def change
    create_table :cash_outs do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.references :bank, index: true, foreign_key: true
      t.references :debit, index: true, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :serial_outer
      t.string :serial_inner
      t.string :state
      t.string :note
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
