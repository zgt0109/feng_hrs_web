class CreateVerificationAgents < ActiveRecord::Migration
  def change
    create_table :verification_agents do |t|
      t.references :enterprise, index: true, foreign_key: true
      t.string :front
      t.string :back
      t.string :name
      t.string :idcard

      t.timestamps null: false
    end
  end
end
