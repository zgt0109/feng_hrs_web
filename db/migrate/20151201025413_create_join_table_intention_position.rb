class CreateJoinTableIntentionPosition < ActiveRecord::Migration
  def change
    create_join_table :intentions, :positions, table_name: 'intentions_positions' do |t|
      t.index [:intention_id, :position_id]
      t.index [:position_id, :intention_id]
    end
  end
end
