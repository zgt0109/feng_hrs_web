class CreateJobQuantities < ActiveRecord::Migration
  def change
    create_table :job_quantities do |t|
      t.references :job, index: true, foreign_key: true
      t.integer :wish_male_count
      t.integer :wish_female_count
      t.integer :wish_unkown_count

      t.timestamps null: false
    end
  end
end
