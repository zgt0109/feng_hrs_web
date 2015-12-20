class CreateVerifyStatuses < ActiveRecord::Migration
  def change
    create_table :verify_statuses do |t|
      t.references :verification, polymorphic: true
      t.string :status

      t.timestamps null: false
    end
  end
end
