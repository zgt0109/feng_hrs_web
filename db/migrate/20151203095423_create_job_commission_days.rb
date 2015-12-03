class CreateJobCommissionDays < ActiveRecord::Migration
  def change
    create_table :job_commission_days do |t|
      t.references :job, index: true, foreign_key: true
      t.string :gender
      t.integer :deadline
      t.integer :amount

      t.timestamps null: false
    end
  end
end
