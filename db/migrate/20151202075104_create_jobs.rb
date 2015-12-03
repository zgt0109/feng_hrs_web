class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.string :name
      t.integer :wage
      t.string :unit
      t.integer :worktime
      t.integer :royalty
      t.integer :bonus
      t.string :channel
      t.integer :wageday
      t.string :wageday_unit
      t.integer :advance
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
