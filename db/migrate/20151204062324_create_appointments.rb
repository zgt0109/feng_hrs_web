class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :job, index: true, foreign_key: true
      t.references :labor, index: true, foreign_key: true
      t.references :zhao, index: true
      t.references :song, index: true
      t.string :state

      t.timestamps null: false
    end
    add_index :appointments, :state
  end
end
