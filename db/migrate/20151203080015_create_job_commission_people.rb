class CreateJobCommissionPeople < ActiveRecord::Migration
  def change
    create_table :job_commission_people do |t|
      t.references :job, index: true, foreign_key: true
      t.string :gender
      t.integer :amount
      t.string :unit
      t.integer :deadline
      t.integer :check
      t.integer :remit

      t.timestamps null: false
    end
  end
end
